// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "06883113174f852b69e1689c2878a124"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: UserProfile.self)
    ModelRegistry.register(modelType: UserFavoriteContent.self)
    ModelRegistry.register(modelType: UserContent.self)
    ModelRegistry.register(modelType: UserSubscriptionTrainer.self)
  }
}