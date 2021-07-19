const express = require("express");
const bodyParser = require("body-parser");
const awsServerlessExpressMiddleware = require("aws-serverless-express/middleware");
const AWS = require("aws-sdk");
const gql = require("graphql-tag");
const AWSAppSyncClient = require("aws-appsync").default;
const { from } = require("apollo-link");
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
const queryAllFavorite = gql`
  query MyQuery($contentId: ID!) {
    listUserFavoriteContents(filter: {userFavoriteContentContentId: {eq: $contentId}}) {
      items {
        id
        userFavoriteContentContentId
      }
    }
  }
`;
const delFavorite = gql`
    mutation MyMutation($id: ID!) {
      deleteUserFavoriteContent(input: {id: $id}) {
        id
      }
    }
`
const fetchAllFavorites = async (contentModel) => {
    const delFavId = contentModel.id.S;
    const client = await appsyncClient.hydrated();
    const favDic = await client.query({
        query: queryAllFavorite,
        variables: {contentId:delFavId},
    });
    const favList = favDic.data.listUserFavoriteContents.items;
    for (var i = 0; i < favList.length; i++) {
        const favItem = favList[i];
        console.log("match id",favItem.id);
        delFavoriteById(favItem.id);
    }
};
const delFavoriteById = async (favId)=>{
    const client = await appsyncClient.hydrated();
    const resultDic = await client.mutate({
        mutation: delFavorite,
        variables: {id:favId},
    });
    console.log(resultDic);
};
exports.handler = event => {
  //eslint-disable-line
  var contentModel;
  for (var i = 0; i < event.Records.length; i++) {
        const record = event.Records[i];
        console.log(record.eventName);
        if (record.eventName === "REMOVE") {
           console.log(JSON.stringify(record));
           contentModel = record.dynamodb.OldImage;
        }
  }
  if (contentModel) {
    fetchAllFavorites(contentModel);
  } else {
    return Promise.resolve("No token transaction is processed.");
  }
};
