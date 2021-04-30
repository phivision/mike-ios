// swiftlint:disable all
import Amplify
import Foundation

extension UserContent {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case ContentName
    case Description
    case Title
    case Level
    case Length
    case IsDemo
    case ViewCount
    case Thumbnail
    case Preview
    case Creator
    case FavoriteUser
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let userContent = UserContent.keys
    
    model.authRules = [
      rule(allow: .owner, ownerField: "owner", identityClaim: "cognito:username", operations: [.create, .delete, .update])
    ]
    
    model.pluralName = "UserContents"
    
    model.fields(
      .id(),
      .field(userContent.ContentName, is: .required, ofType: .string),
      .field(userContent.Description, is: .optional, ofType: .string),
      .field(userContent.Title, is: .optional, ofType: .string),
      .field(userContent.Level, is: .optional, ofType: .int),
      .field(userContent.Length, is: .optional, ofType: .double),
      .field(userContent.IsDemo, is: .optional, ofType: .bool),
      .field(userContent.ViewCount, is: .optional, ofType: .int),
      .field(userContent.Thumbnail, is: .optional, ofType: .string),
      .field(userContent.Preview, is: .optional, ofType: .string),
      .belongsTo(userContent.Creator, is: .optional, ofType: UserProfile.self, targetName: "CreatorID"),
      .hasMany(userContent.FavoriteUser, is: .optional, ofType: UserFavoriteContent.self, associatedWith: UserFavoriteContent.keys.Content)
    )
    }
}