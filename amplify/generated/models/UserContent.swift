// swiftlint:disable all
import Amplify
import Foundation

public struct UserContent: Model {
  public let id: String
  public var ContentName: String
  public var Description: String?
  public var Level: Int?
  public var Length: Double?
  public var IsDemo: Bool?
  public var ViewCount: Int?
  public var Thumbnail: String?
  public var Preview: String?
  public var Creator: UserProfile?
  public var FavoriteUser: List<UserFavoriteContent>?
  
  public init(id: String = UUID().uuidString,
      ContentName: String,
      Description: String? = nil,
      Level: Int? = nil,
      Length: Double? = nil,
      IsDemo: Bool? = nil,
      ViewCount: Int? = nil,
      Thumbnail: String? = nil,
      Preview: String? = nil,
      Creator: UserProfile? = nil,
      FavoriteUser: List<UserFavoriteContent>? = []) {
      self.id = id
      self.ContentName = ContentName
      self.Description = Description
      self.Level = Level
      self.Length = Length
      self.IsDemo = IsDemo
      self.ViewCount = ViewCount
      self.Thumbnail = Thumbnail
      self.Preview = Preview
      self.Creator = Creator
      self.FavoriteUser = FavoriteUser
  }
}