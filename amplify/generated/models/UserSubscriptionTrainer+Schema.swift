// swiftlint:disable all
import Amplify
import Foundation

extension UserSubscriptionTrainer {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case Trainer
    case User
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let userSubscriptionTrainer = UserSubscriptionTrainer.keys
    
    model.authRules = [
      rule(allow: .owner, ownerField: "owner", identityClaim: "cognito:username", operations: [.create, .delete, .update])
    ]
    
    model.pluralName = "UserSubscriptionTrainers"
    
    model.fields(
      .id(),
      .belongsTo(userSubscriptionTrainer.Trainer, is: .required, ofType: UserProfile.self, targetName: "userSubscriptionTrainerTrainerId"),
      .belongsTo(userSubscriptionTrainer.User, is: .required, ofType: UserProfile.self, targetName: "userSubscriptionTrainerUserId")
    )
    }
}