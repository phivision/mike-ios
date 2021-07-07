const https = require("https");
const AWS = require("aws-sdk");
const urlParse = require("url").URL;
const appsyncUrl = process.env.API_MIKEAMPLIFY_GRAPHQLAPIENDPOINTOUTPUT;
const region = process.env.REGION;
const endpoint = new urlParse(appsyncUrl).hostname.toString();

const graphql = require("graphql");
const gql = require("graphql-tag");
const { print } = graphql;

const getUserProfile = gql`
  query getUserProfile($id: ID!) {
    getUserProfile(id: $id) {
      Email
      FirstName
      IsVerified
      LandingURL
      LastName
      StripeID
      TokenBalance
      TokenPrice
      UserRole
    }
  }
`;

const getProfileByID = async (id) => {
  const req = new AWS.HttpRequest(appsyncUrl, region);

  const item = {
    id: id,
  };

  req.method = "POST";
  req.path = "/graphql";
  req.headers.host = endpoint;
  req.headers["Content-Type"] = "application/json";
  req.body = JSON.stringify({
    query: print(getUserProfile),
    operationName: "getUserProfile",
    variables: item,
  });

  const signer = new AWS.Signers.V4(req, "appsync", true);
  signer.addAuthorization(AWS.config.credentials, AWS.util.date.getDate());

  const data = await new Promise((resolve, reject) => {
    const httpRequest = https.request({ ...req, host: endpoint }, (result) => {
      let data = "";

      result.on("data", (chunk) => {
        data += chunk;
      });

      result.on("end", () => {
        resolve(JSON.parse(data.toString()));
      });
    });

    httpRequest.write(req.body);
    httpRequest.end();
  });

  return data.data.getUserProfile;
};

const updateUserProfile = gql`
  mutation updateUserProfile($input: UpdateUserProfileInput!) {
    updateUserProfile(input: $input) {
      id
      StripeID
    }
  }
`;

const setStripeID = async (id, stripeID) => {
  const req = new AWS.HttpRequest(appsyncUrl, region);

  const input = { id: id, StripeID: stripeID };

  req.method = "POST";
  req.path = "/graphql";
  req.headers.host = endpoint;
  req.headers["Content-Type"] = "application/json";
  req.body = JSON.stringify({
    query: print(updateUserProfile),
    operationName: "updateUserProfile",
    variables: { input: input },
  });

  const signer = new AWS.Signers.V4(req, "appsync", true);
  signer.addAuthorization(AWS.config.credentials, AWS.util.date.getDate());

  const data = await new Promise((resolve, reject) => {
    const httpRequest = https.request({ ...req, host: endpoint }, (result) => {
      let data = "";

      result.on("data", (chunk) => {
        data += chunk;
      });

      result.on("end", () => {
        resolve(JSON.parse(data.toString()));
      });
    });

    httpRequest.write(req.body);
    httpRequest.end();
  });

  console.log(data);

  return data;
};

module.exports = { getProfileByID, setStripeID };
