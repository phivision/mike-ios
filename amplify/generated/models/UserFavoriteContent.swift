// swiftlint:disable all
import Amplify
import Foundation

public struct UserFavoriteContent: Model {
  public let id: String
  public var User: UserProfile
  public var Content: UserContent
  
  public init(id: String = UUID().uuidString,
      User: UserProfile,
      Content: UserContent) {
      self.id = id
      self.User = User
      self.Content = Content
  }
}