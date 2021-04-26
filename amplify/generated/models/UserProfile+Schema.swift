// swiftlint:disable all
import Amplify
import Foundation

extension UserProfile {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case Birthday
    case Email
    case Gender
    case Height
    case Price
    case RegDate
    case StripeID
    case UserImage
    case BgImage
    case BgTitle
    case LastName
    case FirstName
    case UserRole
    case Weight
    case Description
    case Biography
    case Favorites
    case Contents
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let userProfile = UserProfile.keys
    
    model.authRules = [
      rule(allow: .owner, ownerField: "owner", identityClaim: "cognito:username", operations: [.create, .delete, .update])
    ]
    
    model.pluralName = "UserProfiles"
    
    model.fields(
      .id(),
      .field(userProfile.Birthday, is: .optional, ofType: .date),
      .field(userProfile.Email, is: .optional, ofType: .string),
      .field(userProfile.Gender, is: .optional, ofType: .string),
      .field(userProfile.Height, is: .optional, ofType: .double),
      .field(userProfile.Price, is: .optional, ofType: .double),
      .field(userProfile.RegDate, is: .required, ofType: .string),
      .field(userProfile.StripeID, is: .optional, ofType: .string),
      .field(userProfile.UserImage, is: .optional, ofType: .string),
      .field(userProfile.BgImage, is: .optional, ofType: .string),
      .field(userProfile.BgTitle, is: .optional, ofType: .string),
      .field(userProfile.LastName, is: .optional, ofType: .string),
      .field(userProfile.FirstName, is: .optional, ofType: .string),
      .field(userProfile.UserRole, is: .required, ofType: .string),
      .field(userProfile.Weight, is: .optional, ofType: .double),
      .field(userProfile.Description, is: .optional, ofType: .string),
      .field(userProfile.Biography, is: .optional, ofType: .string),
      .hasMany(userProfile.Favorites, is: .optional, ofType: UserContent.self, associatedWith: UserContent.keys.userProfileFavoritesId),
      .hasMany(userProfile.Contents, is: .optional, ofType: UserContent.self, associatedWith: UserContent.keys.Creator)
    )
    }
}