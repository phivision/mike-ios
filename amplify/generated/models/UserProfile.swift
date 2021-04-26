// swiftlint:disable all
import Amplify
import Foundation

public struct UserProfile: Model {
  public let id: String
  public var Birthday: Temporal.Date?
  public var Email: String?
  public var Gender: String?
  public var Height: Double?
  public var Price: Double?
  public var RegDate: String
  public var StripeID: String?
  public var UserImage: String?
  public var BgImage: String?
  public var BgTitle: String?
  public var LastName: String?
  public var FirstName: String?
  public var UserRole: String
  public var Weight: Double?
  public var Description: String?
  public var Biography: String?
  public var Favorites: List<UserContent>?
  public var Contents: List<UserContent>?
  
  public init(id: String = UUID().uuidString,
      Birthday: Temporal.Date? = nil,
      Email: String? = nil,
      Gender: String? = nil,
      Height: Double? = nil,
      Price: Double? = nil,
      RegDate: String,
      StripeID: String? = nil,
      UserImage: String? = nil,
      BgImage: String? = nil,
      BgTitle: String? = nil,
      LastName: String? = nil,
      FirstName: String? = nil,
      UserRole: String,
      Weight: Double? = nil,
      Description: String? = nil,
      Biography: String? = nil,
      Favorites: List<UserContent>? = [],
      Contents: List<UserContent>? = []) {
      self.id = id
      self.Birthday = Birthday
      self.Email = Email
      self.Gender = Gender
      self.Height = Height
      self.Price = Price
      self.RegDate = RegDate
      self.StripeID = StripeID
      self.UserImage = UserImage
      self.BgImage = BgImage
      self.BgTitle = BgTitle
      self.LastName = LastName
      self.FirstName = FirstName
      self.UserRole = UserRole
      self.Weight = Weight
      self.Description = Description
      self.Biography = Biography
      self.Favorites = Favorites
      self.Contents = Contents
  }
}