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
                          Contents(limit: 100) {
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
                                CreatorID
                                Segments
                                TranscodeReady
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
                        CreatorID
                        Segments
                        TranscodeReady
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
          }
        }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                    variables: ["id": id],
                                    responseType: JSONValue.self)
    }
    static func fetchSubscriptionTrainerList() -> GraphQLRequest<JSONValue>{
        let document = """
        query getUserProfile($id:ID!) {
          getUserProfile(id:$id) {
              Subscriptions {
                  items {
                    Trainer {
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
                      StripeID
                      UserImage
                      UserRole
                      Weight
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
                                         variables: ["id": LoginTools.sharedTools.userId()],
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
                    TranscodeReady
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
    static func fetchTrainerContentList(byId id: String) -> GraphQLRequest<JSONValue>{
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
                    TranscodeReady
                  }
                }
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
    //mutation user profile
    static func editUserProfile(byFirstName firstName:String,LastName lastName:String,Description desc:String,UserImage userImage:String) -> GraphQLRequest<JSONValue>{
        let document = """
                mutation MyMutation($id:ID!,$firstname:String!,$lastname:String!,$desc:String!,$userImage:String!) {
                  updateUserProfile(input: {LastName: $lastname, FirstName: $firstname, Description: $desc, UserImage: $userImage, id: $id}) {
                    id
                  }
                }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["id": LoginTools.sharedTools.userId(),"firstname":firstName,"lastname":lastName,"desc":desc,"userImage":userImage],
                                    responseType: JSONValue.self)
        
    }
    //create user content
    static func createUserContent(byTitle title:String,description desc:String,IsDemo isDemo:Bool,ContentName contentName:String,Thumbnail thumbnail:String,Segments segments:String) -> GraphQLRequest<JSONValue>{
        let document = """
                mutation MyMutation($ContentName:String!,$CreatorID:ID!,$Description:String,$IsDemo:Boolean,$Segments:AWSJSON,$Thumbnail:String,$Title:String) {
                    createUserContent(input: {ContentName:$ContentName, CreatorID:$CreatorID, Description:$Description, IsDemo:$IsDemo, Segments:$Segments, Thumbnail:$Thumbnail, Title:$Title}) {
                        id
                      }
                }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["CreatorID": LoginTools.sharedTools.userId(),"ContentName":contentName,"Description":desc,"IsDemo":isDemo,"Segments":segments,"Thumbnail":thumbnail,"Title":title],
                                    responseType: JSONValue.self)
    }
    static func subscriptionMsg(byUserId userId: String) -> GraphQLRequest<JSONValue> {
            let document = """
            subscription MySubscription($id:ID!) {
              onMessagesByToUserID(ToUserID:$id) {
                id
                PostMessages
                ToUserID
                FromUserID
                Status
                Type
                createdAt
                ToUser {
                    FirstName
                    LastName
                    UserImage
                }
                FromUser {
                    LastName
                    FirstName
                    UserImage
                }
              }
            }
            """
            return GraphQLRequest<JSONValue>(document: document,
                                        variables: ["id": userId],
                                        responseType: JSONValue.self)
        }
    static func createMsgToUser(byToUserId toUserId:String,_ msgContent:String) -> GraphQLRequest<JSONValue>{
        let document = """
        mutation MyMutation($FromUserID:ID!,$PostMessages:String!,$ToUserID:ID!) {
          createMessage(input: {FromUserID: $FromUserID, PostMessages: $PostMessages, Status: UNRESPONDED, ToUserID: $ToUserID, Type: TEXT}) {
            id
            PostMessages
            ToUserID
            FromUserID
            Status
            Type
            createdAt
            ToUser {
              FirstName
              LastName
              UserImage
            }
            FromUser {
              LastName
              FirstName
              UserImage
            }
          }
        }
        """
        print("\(LoginTools.sharedTools.userId())~~~~~~~~~~~~\(toUserId)~~~~~~~~~~~~~~~~~\(msgContent)")
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["FromUserID": LoginTools.sharedTools.userId(),"ToUserID":toUserId,"PostMessages":msgContent],
                                    responseType: JSONValue.self)
    }
    static func fetchMessageByUser(fromUserId:String,toUserId:String,status:String) -> GraphQLRequest<JSONValue>{
        if LoginTools.sharedTools.userInfo().userRole == "trainer" {
            let document = """
            query MyQuery($status: MessageStatus!, $fromUserId: ID!, $toUserId: ID!) {
              messageByToUserID(ToUserID: $toUserId, filter: {FromUserID: {eq: $fromUserId}, Status: {eq: $status}}) {
                items {
                        id
                        PostMessages
                        ToUserID
                        FromUserID
                        Status
                        Type
                        createdAt
                        ToUser {
                          FirstName
                          LastName
                          UserImage
                        }
                        FromUser {
                          LastName
                          FirstName
                          UserImage
                        }
                }
              }
            }
            """
            return GraphQLRequest<JSONValue>(document: document,
                                             variables: ["toUserId": toUserId,"fromUserId":fromUserId,"status":status],
                                        responseType: JSONValue.self)
        }else{
            let document = """
            query MyQuery($toUserId: ID!, $fromUserId: ID!,$status:MessageStatus! ) {
              messageByFromUserID(filter: {ToUserID: {eq: $toUserId}, Status: {eq: $status}}, FromUserID: $fromUserId) {
                items {
                        id
                        PostMessages
                        ToUserID
                        FromUserID
                        Status
                        Type
                        createdAt
                        ToUser {
                          FirstName
                          LastName
                          UserImage
                        }
                        FromUser {
                          LastName
                          FirstName
                          UserImage
                        }
                }
              }
            }
            """
            
            return GraphQLRequest<JSONValue>(document: document,
                                             variables: ["toUserId": toUserId,"fromUserId":fromUserId,"status":status],
                                        responseType: JSONValue.self)
        }
    }
    static func fetchMessageByToUserId(toUserId:String,status:String) -> GraphQLRequest<JSONValue>{
        print("\(toUserId)~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\(status)")
        let document = """
        query MyQuery2($ToUserID: ID = "", $eq: MessageStatus = UNRESPONDED) {
          messageByToUserID(ToUserID: $ToUserID, filter: {Status: {eq: $eq}}) {
            items {
                    id
                    PostMessages
                    ToUserID
                    FromUserID
                    Status
                    Type
                    createdAt
                    ToUser {
                      FirstName
                      LastName
                      UserImage
                    }
                    FromUser {
                      LastName
                      FirstName
                      UserImage
                    }
            }
          }
        }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["ToUserID": toUserId,"eq":status],
                                    responseType: JSONValue.self)
    }
    static func updateMessageStatus(byToMessageModel msgModel:MessageListModel,messageStatus status:String) -> GraphQLRequest<JSONValue>{
        let document = """
        mutation MyMutation3($id: ID = "",$status:MessageStatus) {
                  updateMessage(input: {id: $id, Status: $status}) {
                            id
                            PostMessages
                            ToUserID
                            FromUserID
                            Status
                            Type
                            createdAt
                            ToUser {
                              FirstName
                              LastName
                              UserImage
                            }
                            FromUser {
                              LastName
                              FirstName
                              UserImage
                            }
                  }
                }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["id": msgModel.id ?? "","status":"RESPONDED"],
                                    responseType: JSONValue.self)
    }
    static func fetchUserTokenBalance(byUserId userId:String) -> GraphQLRequest<JSONValue>{
        let document = """
            query MyQuery($id: ID!) {
              getUserProfile(id: $id) {
                TokenBalance
              }
            }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["id": userId],
                                    responseType: JSONValue.self)
    }
}
