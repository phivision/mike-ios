// swiftlint:disable all
import Amplify
import Foundation

extension UserFavoriteContent {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case User
    case Content
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let userFavoriteContent = UserFavoriteContent.keys
    
    model.authRules = [
      rule(allow: .owner, ownerField: "owner", identityClaim: "cognito:username", operations: [.create, .delete, .update])
    ]
    
    model.pluralName = "UserFavoriteContents"
    
    model.fields(
      .id(),
      .belongsTo(userFavoriteContent.User, is: .required, ofType: UserProfile.self, targetName: "userFavoriteContentUserId"),
      .belongsTo(userFavoriteContent.Content, is: .required, ofType: UserContent.self, targetName: "userFavoriteContentContentId")
    )
    }
}