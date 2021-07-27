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
                          TokenPrice
                          TokenBalance
                          SubscriptionPrice
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
                TokenPrice
                TokenBalance
                SubscriptionPrice
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
            TokenPrice
            TokenBalance
            SubscriptionPrice
            UserMessageGroup {
                id
            }
            Subscriptions {
              items {
                Trainer {
                  UserImage
                  id
                  TokenPrice
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
                    id
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
                      TokenPrice
                      TokenBalance
                      SubscriptionPrice
                      UserMessageGroup {
                        id
                      }
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
    static func fetchSubscriptionUserList() -> GraphQLRequest<JSONValue>{
        let document = """
        query getUserProfile($id:ID!) {
          getUserProfile(id:$id) {
              Users {
                  items {
                    User {
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
            id
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
                TokenPrice
                TokenBalance
                SubscriptionPrice
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
    static func createUserContent(byTitle title:String,description desc:String,ContentName contentName:String,Thumbnail thumbnail:String,Segments segments:String) -> GraphQLRequest<JSONValue>{
        let document = """
                mutation MyMutation($ContentName: String!, $CreatorID: ID!, $Description: String, $Segments: AWSJSON, $Thumbnail: String, $Title: String, $TranscodeReady: Boolean = false) {
                  createUserContent(input: {ContentName: $ContentName, CreatorID: $CreatorID, Description: $Description, Segments: $Segments, Thumbnail: $Thumbnail, Title: $Title, TranscodeReady: $TranscodeReady}) {
                    CreatorID
                    id
                  }
                }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["CreatorID": LoginTools.sharedTools.userId(),"ContentName":contentName,"Description":desc,"Segments":segments,"Thumbnail":thumbnail,"Title":title],
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
    static func createMsgToTrainer(byToTrainerId trainerId:String,_ msgContent:String) -> GraphQLRequest<JSONValue>{
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
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["FromUserID": LoginTools.sharedTools.userId(),"ToUserID":trainerId,"PostMessages":msgContent],
                                    responseType: JSONValue.self)
    }
    static func createMsgToUser(byToUserId toUserId:String,_ msgContent:String) -> GraphQLRequest<JSONValue>{
        let document = """
        mutation MyMutation($FromUserID:ID!,$PostMessages:String!,$ToUserID:ID!) {
          createMessage(input: {FromUserID: $FromUserID, PostMessages: $PostMessages, Status: UNREAD, ToUserID: $ToUserID, Type: TEXT}) {
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
              messageByToUserID(ToUserID: $toUserId, filter: {FromUserID: {eq: $fromUserId}, Status: {eq: $status}}, limit: 10000) {
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
              messageByFromUserID(filter: {ToUserID: {eq: $toUserId}, Status: {eq: $status}}, FromUserID: $fromUserId, limit: 10000) {
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
          messageByToUserID(ToUserID: $ToUserID, filter: {Status: {eq: $eq}}, limit: 10000) {
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
    static func fetchUserTokenPrice(byTrainerId trainerId:String) -> GraphQLRequest<JSONValue>{
        let document = """
            query MyQuery($id: ID!) {
              getUserProfile(id: $id) {
                TokenPrice
              }
            }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["id": trainerId],
                                    responseType: JSONValue.self)
    }
    static func uploadUserDeviceToken(byUserId userId:String,deviceToken:String) -> GraphQLRequest<JSONValue>{
        let document = """
                mutation MyMutation($id: ID!, $DeviceToken: String) {
                  updateUserProfile(input: {id: $id, DeviceToken: $DeviceToken}) {
                    DeviceToken
                  }
                }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["id": userId,"DeviceToken":deviceToken],
                                    responseType: JSONValue.self)
    }
    static func fetchTrainerList(byKeyword keyword:String) -> GraphQLRequest<JSONValue>{
        let document = """
                query MyQuery($keyword: String!) {
                  trainerSearch(keyword: $keyword) {
                    items {
                      LastName
                      UserRole
                      id
                      UserImage
                      FirstName
                    }
                  }
                }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["keyword": keyword],
                                    responseType: JSONValue.self)
    }
    
    static func subscriptionGroupMsg(byGroupId groupId: String) -> GraphQLRequest<JSONValue> {
            let document = """
                subscription MySubscription($GroupID: ID = "") {
                  onMessageByGroupID(GroupID: $GroupID) {
                    FromUser {
                      LastName
                      FirstName
                      UserImage
                    }
                    PostMessages
                    GroupID
                    FromUserID
                    Status
                    ToUserID
                    Type
                    createdAt
                    owner
                    id
                    
                  }
                }
            """
            return GraphQLRequest<JSONValue>(document: document,
                                        variables: ["GroupID": groupId],
                                        responseType: JSONValue.self)
        }
    static func createMsgToGroup(byGroupId groupId:String,_ msgContent:String) -> GraphQLRequest<JSONValue>{
        let document = """
        mutation MyMutation3($FromUserID: ID!,$ToUserID: ID!, $GroupID: ID!, $PostMessages: String!) {
          createMessage(input: {FromUserID: $FromUserID, ToUserID: $ToUserID, PostMessages: $PostMessages, GroupID: $GroupID, Type: TEXT, Status: UNREAD}) {
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
            GroupID
          }
        }
        """
        print("\(LoginTools.sharedTools.userId())~~~~~~~~~~~~\(groupId)~~~~~~~~~~~~~~~~~\(msgContent)")
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["FromUserID": LoginTools.sharedTools.userId(),"ToUserID":LoginTools.sharedTools.userId(),"PostMessages":msgContent,"GroupID":groupId],
                                    responseType: JSONValue.self)
    }
    static func fetchMessageByTrainerId(trainerId:String) -> GraphQLRequest<JSONValue>{
        let document = """
            query MyQuery($id: ID!) {
              getUserProfile(id: $id) {
                UserMessageGroup {
                  Messages(sortDirection: ASC) {
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
              }
            }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["id": trainerId],
                                    responseType: JSONValue.self)
    }
    
    static func delSubscription(bySubscribeId subscribeId:String) -> GraphQLRequest<JSONValue>{
        let document = """
                    mutation MyMutation($id: ID!) {
                      deleteUserSubscriptionTrainer(input: {id: $id}) {
                        id
                      }
                    }
        """
        return GraphQLRequest<JSONValue>(document: document,
                                         variables: ["id": subscribeId],
                                    responseType: JSONValue.self)
    }
    static func subscriptionNewContent(byCreatorId creatorId: String) -> GraphQLRequest<JSONValue> {
            let document = """
                    subscription MySubscription($CreatorID: ID!) {
                      onUpdateByCreatorID(CreatorID: $CreatorID) {
                        CreatorID
                        id
                      }
                    }
            """
            return GraphQLRequest<JSONValue>(document: document,
                                        variables: ["CreatorID": creatorId],
                                        responseType: JSONValue.self)
        }
    static func updateTokenPriceAndSubPrice(tokenPrice tPrice:String,subPrice subscriptionPrice:String) -> GraphQLRequest<JSONValue> {
            let document = """
                        mutation MyMutation($id: ID!, $SubscriptionPrice: Int, $TokenPrice: Int) {
                          updateUserProfile(input: {id: $id, SubscriptionPrice: $SubscriptionPrice, TokenPrice: $TokenPrice}) {
                            id
                            TokenPrice
                            SubscriptionPrice
                          }
                        }
            """
            return GraphQLRequest<JSONValue>(document: document,
                                             variables: ["id": LoginTools.sharedTools.userId(),"SubscriptionPrice":subscriptionPrice,"TokenPrice":tPrice],
                                        responseType: JSONValue.self)
        }
    


    
}
