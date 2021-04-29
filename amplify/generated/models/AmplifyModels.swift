// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "4b3990c69e4a9235004cf2e565706d7e"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: UserProfile.self)
    ModelRegistry.register(modelType: UserFavoriteContent.self)
    ModelRegistry.register(modelType: UserContent.self)
    ModelRegistry.register(modelType: UserSubscriptionTrainer.self)
  }
}