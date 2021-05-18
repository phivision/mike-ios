//
//  GraphQLRequestExt.swift
//  Mike
//
//  Created by 殷聃 on 2021/4/29.
//

import Foundation
import Amplify

extension GraphQLRequest{
    static func getSubscriptionList(byId id: String) -> GraphQLRequest<JSONValue> {
            let document = """
            query getUserProfile($id:ID!) {
              getUserProfile(id:$id) {
                Subscriptions {
                      items {
                        id
                        Trainer {
                          id
                          UserRole
                          UserImage
                          LastName
                          FirstName
                          Contents(limit: 10) {
                            items {
                                id
                                ContentName
                                Description
                                Title
                                Level
                                Length
                                IsDemo
                                ViewCount
                                Thumbnail
                                Preview
                                createdAt
                                updatedAt
                            }
                          }
                        }
                      }
                    }
              }
            }
            """
            return GraphQLRequest<JSONValue>(document: document,
                                        variables: ["id": id],
                                        responseType: JSONValue.self)
        }
//    public let id: String
//    public var ContentName: String
//    public var Description: String?
//    public var Title: String?
//    public var Level: Int?
//    public var Length: Double?
//    public var IsDemo: Bool?
//    public var ViewCount: Int?
//    public var Thumbnail: String?
//    public var Preview: String?
    static func getContentList(byId id: String) -> GraphQLRequest<JSONValue> {
            let document = """
            query getUserProfile($id:ID!) {
              getUserProfile(id:$id) {
                  Contents {
                      items {
                        id
                        ContentName
                        Description
                        Title
                        Level
                        Length
                        IsDemo
                        ViewCount
                        Thumbnail
                        Preview
                      }
                    }
              }
            }
            """
            return GraphQLRequest<JSONValue>(document: document,
                                        variables: ["id": id],
                                        responseType: JSONValue.self)
        }
    static func fetchUserProfile(byId id: String) -> GraphQLRequest<JSONValue> {
            let document = """
            query getUserProfile($id:ID!) {
              getUserProfile(id:$id) {
                id
                Birthday
                Email
                Gender
                Height
                RegDate
                StripeID
                UserImage
                BgImage
                BgTitle
                LastName
                FirstName
                UserRole
                Weight
                Description
                Biography
              }
            }
            """
            return GraphQLRequest<JSONValue>(document: document,
                                        variables: ["id": id],
                                        responseType: JSONValue.self)
        }
    
    static func fetchUserProfileModel(byId id: String) -> GraphQLRequest<JSONValue> {
        let document = """
        query getUserProfile($id:ID!) {
          getUserProfile(id:$id) {
            Contents {
              nextToken
            }
            BgImage
            BgTitle
            Biography
            Birthday
            Description
            Email
            FirstName
            Gender
            Height
            LastName
            RegDate
            UserImage
            UserRole
            Weight
            createdAt
            id
            owner
            updatedAt
            Subscriptions {
              items {
                Trainer {
                  UserImage
                  id
                }
              }
            }
          }
        }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                    variables: ["id": id],
                                    responseType: JSONValue.self)
    }
    static func fetchUserFavList(byId id: String) -> GraphQLRequest<JSONValue> {
        let document = """
        query getUserProfile($id:ID!) {
          getUserProfile(id:$id) {
            Favorites {
              items {
                Content {
                  ContentName
                  Description
                  IsDemo
                  Length
                  Level
                  Preview
                  Segments
                  Thumbnail
                  Title
                  ViewCount
                  createdAt
                  id
                  owner
                  updatedAt
                }
              }
            }
          }
        }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                    variables: ["id": id],
                                    responseType: JSONValue.self)
    }
    static func fetchSimpleTrainerModel(byId id: String) -> GraphQLRequest<JSONValue> {
        let document = """
        query getUserProfile($id:ID!) {
          getUserProfile(id:$id) {
            LastName
            FirstName
            UserImage
          }
        }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                    variables: ["id": id],
                                    responseType: JSONValue.self)
    }
    static func fetchTrainerDetail(byId id: String) -> GraphQLRequest<JSONValue>{
        let document = """
            query MyQuery($id:ID!) {
              getUserProfile(id:$id) {
                Contents {
                  items {
                    ContentName
                    CreatorID
                    Description
                    IsDemo
                    Length
                    Level
                    Preview
                    Segments
                    Thumbnail
                    Title
                    ViewCount
                    createdAt
                    id
                    owner
                    updatedAt
                  }
                }
                Favorites {
                  items {
                    Content {
                      ContentName
                      CreatorID
                      Description
                      IsDemo
                      Length
                      Level
                      Preview
                      Segments
                      Thumbnail
                      Title
                      ViewCount
                      createdAt
                      id
                      owner
                      updatedAt
                    }
                  }
                }
                BgImage
                BgTitle
                Biography
                Birthday
                Description
                Email
                Gender
                FirstName
                Height
                LastName
                RegDate
                UserImage
                UserRole
                Weight
                createdAt
                updatedAt
              }
            }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                    variables: ["id": id],
                                    responseType: JSONValue.self)
    }
    //MARK: - Favorite
    //fetch favorite user list
    static func fetchUserList(byContentId id: String) -> GraphQLRequest<JSONValue>{
        let document = """
        query MyQuery($id:ID!) {
          getUserContent(id:$id) {
            FavoriteUser {
              items {
                User {
                  id
                }
              }
            }
          }
        }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                    variables: ["id": id],
                                    responseType: JSONValue.self)
    }
    //add favorite to user
    static func addFav(byContentId id: String) -> GraphQLRequest<JSONValue>{
        let document = """
        mutation MyMutation($id:ID!,$userid:ID!){
          createUserFavoriteContent(input: {userFavoriteContentUserId: $userid, userFavoriteContentContentId: $id}) {
            id
          }
        }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                       variables: ["id": id,"userid":LoginTools.sharedTools.userId()],
                                    responseType: JSONValue.self)
    }
    //del favorite by fav relationId
    static func delFav(byFavRelationId id: String) -> GraphQLRequest<JSONValue>{
        let document = """
        mutation MyMutation($id:ID!){
          deleteUserFavoriteContent(input: {id: $id}) {
            id
          }
        }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                       variables: ["id": id],
                                    responseType: JSONValue.self)
    }
    //fetch user fav relationship id list
    static func fetchFavRelationIdList() -> GraphQLRequest<JSONValue>{
        let document = """
            query MyQuery($id:ID!) {
              getUserProfile(id:$id){
                Favorites {
                  items {
                    id
                    Content {
                      id
                    }
                  }
                }
              }
            }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["id": LoginTools.sharedTools.userId()],
                                    responseType: JSONValue.self)
    }
    
}
