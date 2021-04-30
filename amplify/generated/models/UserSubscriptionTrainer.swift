// swiftlint:disable all
import Amplify
import Foundation

public struct UserSubscriptionTrainer: Model {
  public let id: String
  public var Trainer: UserProfile
  public var User: UserProfile
  public var ExpireDate: String
  
  public init(id: String = UUID().uuidString,
      Trainer: UserProfile,
      User: UserProfile,
      ExpireDate: String) {
      self.id = id
      self.Trainer = Trainer
      self.User = User
      self.ExpireDate = ExpireDate
  }
}