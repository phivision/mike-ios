const express = require("express");
const bodyParser = require("body-parser");
const awsServerlessExpressMiddleware = require("aws-serverless-express/middleware");
const AWS = require("aws-sdk");
const gql = require("graphql-tag");
const AWSAppSyncClient = require("aws-appsync").default;
require("es6-promise").polyfill();
require("isomorphic-fetch");

const app = express();
app.use(bodyParser.json());
app.use(awsServerlessExpressMiddleware.eventContext());

app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

const url = process.env.API_MIKEAMPLIFY_GRAPHQLAPIENDPOINTOUTPUT;
const region = process.env.REGION;

AWS.config.update({
  region,
  credentials: new AWS.Credentials(
    process.env.AWS_ACCESS_KEY_ID,
    process.env.AWS_SECRET_ACCESS_KEY,
    process.env.AWS_SESSION_TOKEN
  ),
});
const credentials = AWS.config.credentials;

const appsyncClient = new AWSAppSyncClient(
  {
    url,
    region,
    auth: {
      type: "AWS_IAM",
      credentials,
    },
    disableOffline: true,
  },
  {
    defaultOptions: {
      query: {
        fetchPolicy: "network-only",
        errorPolicy: "all",
      },
    },
  }
);

const queryDeviceTokenById = gql`
  query MyQuery($id: ID!) {
    getUserProfile(id: $id) {
      id
      DeviceToken
    }
  }
`;

const queryTokenBalanceById = gql`
  query MyQuery($id: ID!) {
    getUserProfile(id: $id) {
      id
      TokenBalance
      TokenPrice
      UserRole
    }
  }
`;

const updateTokenBalance = gql`
  mutation MyMutation($id: ID!, $TokenBalance: Int) {
    updateUserProfile(input: { id: $id, TokenBalance: $TokenBalance }) {
      id
      TokenBalance
    }
  }
`;
const updateUserTokenBalance = async (msgModel) => {
  const fromUserId = msgModel.FromUserID.S;
  const toUserId = msgModel.ToUserID.S;
  const client = await appsyncClient.hydrated();
  const d = await client.query({
    query: queryTokenBalanceById,
    variables: { id: fromUserId },
  });
  const userRole = d.data.getUserProfile.UserRole;
  const tokenBalance = d.data.getUserProfile.TokenBalance;
  if (userRole === "student") {
    if (tokenBalance > 0) {
      queryAndAddTrainerTokenBalance(fromUserId,toUserId,tokenBalance); 
    } 
  } else {
    console.log("Don't need to mutate!");
  }
};
const queryAndAddTrainerTokenBalance = async (fromUserId,trainerId,userTokenBalance) => {
  const client = await appsyncClient.hydrated(); 
  const dicForTokenBalance = await client.query({
        query: queryTokenBalanceById,
        variables: { id: trainerId },
  });
      //fetch tokenBalance and tokenPrice for trainer
  var tokenPrice = dicForTokenBalance.data.getUserProfile.TokenPrice;
  var tokenBalance = dicForTokenBalance.data.getUserProfile.TokenBalance;
  if (tokenPrice == null){
    tokenPrice = 0;
  }
  if (tokenBalance == null) {
    tokenBalance = tokenPrice;
  } else {
    tokenBalance = tokenBalance + tokenPrice;
  }
  await client.mutate({
    mutation: updateTokenBalance,
    variables: { id: trainerId, TokenBalance: tokenBalance },
  });
  console.log("add trainer token balance suc!");
  await client.mutate({
    mutation: updateTokenBalance,
    variables: { id: fromUserId, TokenBalance: userTokenBalance - tokenPrice },
  });
  console.log("reduce token balance from student!");
};

function CreateMessageRequest(token) {
  var messageRequest = {
    'Addresses': {
      [token]: {
        'ChannelType' : 'APNS'
      }
    },
    'MessageConfiguration': {
      'APNSMessage': {
        'Action': "OPEN_APP",
        'Body': "You have a new message",
        'SilentPush': false,
        'Title': "Message received",
        'TimeToLive': 30,
      }
    }
  };

  return messageRequest
}
//send message to userId
function sendMessage(msgModel){
  const toUserId = msgModel.ToUserID.S;
  appsyncClient
    .hydrated()
    .then((client) => {
      client
        .query({
          query: queryDeviceTokenById,
          variables: { id: toUserId },
        })
        .then((d) => {
          const deviceToken = d.data.getUserProfile.DeviceToken;
          console.log("device token is :",deviceToken);
          var messageRequest = CreateMessageRequest(deviceToken);
          var pinpoint = new AWS.Pinpoint(
            {
              url,
              region,
              auth: {
                type: "AWS_IAM",
                credentials,
              },
              disableOffline: true,
            },
            {
              defaultOptions: {
                query: {
                  fetchPolicy: "network-only",
                  errorPolicy: "all",
                },
              },
            }
          );
          console.log("pinpoint app id is :",process.env.projectId);
          const sendMessagesParams = {
            "ApplicationId": "37d7798ba9c3470ab88013ce41fe5714", // Find it in Pinpoint->All projects
            "MessageRequest": messageRequest
          };
          // Try to send the message.
          pinpoint.sendMessages(sendMessagesParams, function(err, data) {
            if (err) console.log(err);
            else  ShowOutput(data);
          });
        })
        .catch((e) => {
          console.log(e);
          return e.message;
        });
    })
    .catch((e) => {
      console.log(e);
      return e.message;
    });
}
function ShowOutput(data){
  if (data["MessageResponse"]["Result"][recipient["token"]]["DeliveryStatus"]
      == "SUCCESSFUL") {
    var status = "Message sent! Response information: ";
  } else {
    var status = "The message wasn't sent. Response information: ";
  }
  console.log(status);
  console.dir(data, { depth: null });
}

exports.handler = (event) => {
  var message;
  for (var i = 0; i < event.Records.length; i++) {
    const record = event.Records[i];
    if (record.eventName === "INSERT") {
      message = record.dynamodb.NewImage;
    }
  }
  if (message) {
    sendMessage(message);
    updateUserTokenBalance(message);
  } else {
    return Promise.resolve("No token transaction is processed.");
  }
};
