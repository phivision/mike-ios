//  This file was automatically generated and should not be edited.

import AWSAppSync

public struct CreateUserProfileInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil) {
    graphQLMap = ["id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var birthday: String? {
    get {
      return graphQLMap["Birthday"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Birthday")
    }
  }

  public var email: String? {
    get {
      return graphQLMap["Email"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Email")
    }
  }

  public var gender: String? {
    get {
      return graphQLMap["Gender"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Gender")
    }
  }

  public var height: Double? {
    get {
      return graphQLMap["Height"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Height")
    }
  }

  public var regDate: String {
    get {
      return graphQLMap["RegDate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "RegDate")
    }
  }

  public var stripeId: String? {
    get {
      return graphQLMap["StripeID"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var userImage: String? {
    get {
      return graphQLMap["UserImage"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserImage")
    }
  }

  public var bgImage: String? {
    get {
      return graphQLMap["BgImage"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgImage")
    }
  }

  public var bgTitle: String? {
    get {
      return graphQLMap["BgTitle"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgTitle")
    }
  }

  public var lastName: String? {
    get {
      return graphQLMap["LastName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "LastName")
    }
  }

  public var firstName: String? {
    get {
      return graphQLMap["FirstName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "FirstName")
    }
  }

  public var userRole: String {
    get {
      return graphQLMap["UserRole"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserRole")
    }
  }

  public var weight: Double? {
    get {
      return graphQLMap["Weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Weight")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["Description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var biography: String? {
    get {
      return graphQLMap["Biography"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Biography")
    }
  }
}

public struct ModelUserProfileConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(birthday: ModelStringInput? = nil, email: ModelStringInput? = nil, gender: ModelStringInput? = nil, height: ModelFloatInput? = nil, regDate: ModelStringInput? = nil, stripeId: ModelStringInput? = nil, userImage: ModelStringInput? = nil, bgImage: ModelStringInput? = nil, bgTitle: ModelStringInput? = nil, lastName: ModelStringInput? = nil, firstName: ModelStringInput? = nil, userRole: ModelStringInput? = nil, weight: ModelFloatInput? = nil, description: ModelStringInput? = nil, biography: ModelStringInput? = nil, and: [ModelUserProfileConditionInput?]? = nil, or: [ModelUserProfileConditionInput?]? = nil, not: ModelUserProfileConditionInput? = nil) {
    graphQLMap = ["Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "and": and, "or": or, "not": not]
  }

  public var birthday: ModelStringInput? {
    get {
      return graphQLMap["Birthday"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Birthday")
    }
  }

  public var email: ModelStringInput? {
    get {
      return graphQLMap["Email"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Email")
    }
  }

  public var gender: ModelStringInput? {
    get {
      return graphQLMap["Gender"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Gender")
    }
  }

  public var height: ModelFloatInput? {
    get {
      return graphQLMap["Height"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Height")
    }
  }

  public var regDate: ModelStringInput? {
    get {
      return graphQLMap["RegDate"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "RegDate")
    }
  }

  public var stripeId: ModelStringInput? {
    get {
      return graphQLMap["StripeID"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var userImage: ModelStringInput? {
    get {
      return graphQLMap["UserImage"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserImage")
    }
  }

  public var bgImage: ModelStringInput? {
    get {
      return graphQLMap["BgImage"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgImage")
    }
  }

  public var bgTitle: ModelStringInput? {
    get {
      return graphQLMap["BgTitle"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgTitle")
    }
  }

  public var lastName: ModelStringInput? {
    get {
      return graphQLMap["LastName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "LastName")
    }
  }

  public var firstName: ModelStringInput? {
    get {
      return graphQLMap["FirstName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "FirstName")
    }
  }

  public var userRole: ModelStringInput? {
    get {
      return graphQLMap["UserRole"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserRole")
    }
  }

  public var weight: ModelFloatInput? {
    get {
      return graphQLMap["Weight"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Weight")
    }
  }

  public var description: ModelStringInput? {
    get {
      return graphQLMap["Description"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var biography: ModelStringInput? {
    get {
      return graphQLMap["Biography"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Biography")
    }
  }

  public var and: [ModelUserProfileConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserProfileConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserProfileConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserProfileConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserProfileConditionInput? {
    get {
      return graphQLMap["not"] as! ModelUserProfileConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelStringInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, eq: String? = nil, le: String? = nil, lt: String? = nil, ge: String? = nil, gt: String? = nil, contains: String? = nil, notContains: String? = nil, between: [String?]? = nil, beginsWith: String? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: String? {
    get {
      return graphQLMap["le"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: String? {
    get {
      return graphQLMap["ge"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: String? {
    get {
      return graphQLMap["contains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: String? {
    get {
      return graphQLMap["notContains"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [String?]? {
    get {
      return graphQLMap["between"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: String? {
    get {
      return graphQLMap["beginsWith"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public enum ModelAttributeTypes: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case binary
  case binarySet
  case bool
  case list
  case map
  case number
  case numberSet
  case string
  case stringSet
  case null
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "binary": self = .binary
      case "binarySet": self = .binarySet
      case "bool": self = .bool
      case "list": self = .list
      case "map": self = .map
      case "number": self = .number
      case "numberSet": self = .numberSet
      case "string": self = .string
      case "stringSet": self = .stringSet
      case "_null": self = .null
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .binary: return "binary"
      case .binarySet: return "binarySet"
      case .bool: return "bool"
      case .list: return "list"
      case .map: return "map"
      case .number: return "number"
      case .numberSet: return "numberSet"
      case .string: return "string"
      case .stringSet: return "stringSet"
      case .null: return "_null"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelAttributeTypes, rhs: ModelAttributeTypes) -> Bool {
    switch (lhs, rhs) {
      case (.binary, .binary): return true
      case (.binarySet, .binarySet): return true
      case (.bool, .bool): return true
      case (.list, .list): return true
      case (.map, .map): return true
      case (.number, .number): return true
      case (.numberSet, .numberSet): return true
      case (.string, .string): return true
      case (.stringSet, .stringSet): return true
      case (.null, .null): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelSizeInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }
}

public struct ModelFloatInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Double? = nil, eq: Double? = nil, le: Double? = nil, lt: Double? = nil, ge: Double? = nil, gt: Double? = nil, between: [Double?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Double? {
    get {
      return graphQLMap["ne"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Double? {
    get {
      return graphQLMap["eq"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Double? {
    get {
      return graphQLMap["le"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Double? {
    get {
      return graphQLMap["lt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Double? {
    get {
      return graphQLMap["ge"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Double? {
    get {
      return graphQLMap["gt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Double?]? {
    get {
      return graphQLMap["between"] as! [Double?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdateUserProfileInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String? = nil, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String? = nil, weight: Double? = nil, description: String? = nil, biography: String? = nil) {
    graphQLMap = ["id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var birthday: String? {
    get {
      return graphQLMap["Birthday"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Birthday")
    }
  }

  public var email: String? {
    get {
      return graphQLMap["Email"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Email")
    }
  }

  public var gender: String? {
    get {
      return graphQLMap["Gender"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Gender")
    }
  }

  public var height: Double? {
    get {
      return graphQLMap["Height"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Height")
    }
  }

  public var regDate: String? {
    get {
      return graphQLMap["RegDate"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "RegDate")
    }
  }

  public var stripeId: String? {
    get {
      return graphQLMap["StripeID"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var userImage: String? {
    get {
      return graphQLMap["UserImage"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserImage")
    }
  }

  public var bgImage: String? {
    get {
      return graphQLMap["BgImage"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgImage")
    }
  }

  public var bgTitle: String? {
    get {
      return graphQLMap["BgTitle"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgTitle")
    }
  }

  public var lastName: String? {
    get {
      return graphQLMap["LastName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "LastName")
    }
  }

  public var firstName: String? {
    get {
      return graphQLMap["FirstName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "FirstName")
    }
  }

  public var userRole: String? {
    get {
      return graphQLMap["UserRole"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserRole")
    }
  }

  public var weight: Double? {
    get {
      return graphQLMap["Weight"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Weight")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["Description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var biography: String? {
    get {
      return graphQLMap["Biography"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Biography")
    }
  }
}

public struct DeleteUserProfileInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateUserSubscriptionTrainerInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, stripeId: String, expireDate: String, cancelAtPeriodEnd: Bool, userSubscriptionTrainerTrainerId: GraphQLID, userSubscriptionTrainerUserId: GraphQLID) {
    graphQLMap = ["id": id, "StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "userSubscriptionTrainerTrainerId": userSubscriptionTrainerTrainerId, "userSubscriptionTrainerUserId": userSubscriptionTrainerUserId]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var stripeId: String {
    get {
      return graphQLMap["StripeID"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var expireDate: String {
    get {
      return graphQLMap["ExpireDate"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ExpireDate")
    }
  }

  public var cancelAtPeriodEnd: Bool {
    get {
      return graphQLMap["CancelAtPeriodEnd"] as! Bool
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "CancelAtPeriodEnd")
    }
  }

  public var userSubscriptionTrainerTrainerId: GraphQLID {
    get {
      return graphQLMap["userSubscriptionTrainerTrainerId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userSubscriptionTrainerTrainerId")
    }
  }

  public var userSubscriptionTrainerUserId: GraphQLID {
    get {
      return graphQLMap["userSubscriptionTrainerUserId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userSubscriptionTrainerUserId")
    }
  }
}

public struct ModelUserSubscriptionTrainerConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(stripeId: ModelStringInput? = nil, expireDate: ModelStringInput? = nil, cancelAtPeriodEnd: ModelBooleanInput? = nil, and: [ModelUserSubscriptionTrainerConditionInput?]? = nil, or: [ModelUserSubscriptionTrainerConditionInput?]? = nil, not: ModelUserSubscriptionTrainerConditionInput? = nil) {
    graphQLMap = ["StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "and": and, "or": or, "not": not]
  }

  public var stripeId: ModelStringInput? {
    get {
      return graphQLMap["StripeID"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var expireDate: ModelStringInput? {
    get {
      return graphQLMap["ExpireDate"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ExpireDate")
    }
  }

  public var cancelAtPeriodEnd: ModelBooleanInput? {
    get {
      return graphQLMap["CancelAtPeriodEnd"] as! ModelBooleanInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "CancelAtPeriodEnd")
    }
  }

  public var and: [ModelUserSubscriptionTrainerConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserSubscriptionTrainerConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserSubscriptionTrainerConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserSubscriptionTrainerConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserSubscriptionTrainerConditionInput? {
    get {
      return graphQLMap["not"] as! ModelUserSubscriptionTrainerConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelBooleanInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Bool? = nil, eq: Bool? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Bool? {
    get {
      return graphQLMap["ne"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Bool? {
    get {
      return graphQLMap["eq"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdateUserSubscriptionTrainerInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, stripeId: String? = nil, expireDate: String? = nil, cancelAtPeriodEnd: Bool? = nil, userSubscriptionTrainerTrainerId: GraphQLID? = nil, userSubscriptionTrainerUserId: GraphQLID? = nil) {
    graphQLMap = ["id": id, "StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "userSubscriptionTrainerTrainerId": userSubscriptionTrainerTrainerId, "userSubscriptionTrainerUserId": userSubscriptionTrainerUserId]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var stripeId: String? {
    get {
      return graphQLMap["StripeID"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var expireDate: String? {
    get {
      return graphQLMap["ExpireDate"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ExpireDate")
    }
  }

  public var cancelAtPeriodEnd: Bool? {
    get {
      return graphQLMap["CancelAtPeriodEnd"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "CancelAtPeriodEnd")
    }
  }

  public var userSubscriptionTrainerTrainerId: GraphQLID? {
    get {
      return graphQLMap["userSubscriptionTrainerTrainerId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userSubscriptionTrainerTrainerId")
    }
  }

  public var userSubscriptionTrainerUserId: GraphQLID? {
    get {
      return graphQLMap["userSubscriptionTrainerUserId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userSubscriptionTrainerUserId")
    }
  }
}

public struct DeleteUserSubscriptionTrainerInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateUserFavoriteContentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, userFavoriteContentUserId: GraphQLID, userFavoriteContentContentId: GraphQLID) {
    graphQLMap = ["id": id, "userFavoriteContentUserId": userFavoriteContentUserId, "userFavoriteContentContentId": userFavoriteContentContentId]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var userFavoriteContentUserId: GraphQLID {
    get {
      return graphQLMap["userFavoriteContentUserId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userFavoriteContentUserId")
    }
  }

  public var userFavoriteContentContentId: GraphQLID {
    get {
      return graphQLMap["userFavoriteContentContentId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userFavoriteContentContentId")
    }
  }
}

public struct ModelUserFavoriteContentConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(and: [ModelUserFavoriteContentConditionInput?]? = nil, or: [ModelUserFavoriteContentConditionInput?]? = nil, not: ModelUserFavoriteContentConditionInput? = nil) {
    graphQLMap = ["and": and, "or": or, "not": not]
  }

  public var and: [ModelUserFavoriteContentConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserFavoriteContentConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserFavoriteContentConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserFavoriteContentConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserFavoriteContentConditionInput? {
    get {
      return graphQLMap["not"] as! ModelUserFavoriteContentConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct UpdateUserFavoriteContentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, userFavoriteContentUserId: GraphQLID? = nil, userFavoriteContentContentId: GraphQLID? = nil) {
    graphQLMap = ["id": id, "userFavoriteContentUserId": userFavoriteContentUserId, "userFavoriteContentContentId": userFavoriteContentContentId]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var userFavoriteContentUserId: GraphQLID? {
    get {
      return graphQLMap["userFavoriteContentUserId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userFavoriteContentUserId")
    }
  }

  public var userFavoriteContentContentId: GraphQLID? {
    get {
      return graphQLMap["userFavoriteContentContentId"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "userFavoriteContentContentId")
    }
  }
}

public struct DeleteUserFavoriteContentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct CreateUserContentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID? = nil, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil) {
    graphQLMap = ["id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments]
  }

  public var id: GraphQLID? {
    get {
      return graphQLMap["id"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var creatorId: GraphQLID {
    get {
      return graphQLMap["CreatorID"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "CreatorID")
    }
  }

  public var contentName: String {
    get {
      return graphQLMap["ContentName"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ContentName")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["Description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var title: String? {
    get {
      return graphQLMap["Title"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Title")
    }
  }

  public var level: Int? {
    get {
      return graphQLMap["Level"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Level")
    }
  }

  public var length: Double? {
    get {
      return graphQLMap["Length"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Length")
    }
  }

  public var isDemo: Bool? {
    get {
      return graphQLMap["IsDemo"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "IsDemo")
    }
  }

  public var transcodeReady: Bool? {
    get {
      return graphQLMap["TranscodeReady"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "TranscodeReady")
    }
  }

  public var viewCount: Int? {
    get {
      return graphQLMap["ViewCount"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ViewCount")
    }
  }

  public var thumbnail: String? {
    get {
      return graphQLMap["Thumbnail"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Thumbnail")
    }
  }

  public var preview: String? {
    get {
      return graphQLMap["Preview"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Preview")
    }
  }

  public var segments: String? {
    get {
      return graphQLMap["Segments"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Segments")
    }
  }
}

public struct ModelUserContentConditionInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(creatorId: ModelIDInput? = nil, contentName: ModelStringInput? = nil, description: ModelStringInput? = nil, title: ModelStringInput? = nil, level: ModelIntInput? = nil, length: ModelFloatInput? = nil, isDemo: ModelBooleanInput? = nil, transcodeReady: ModelBooleanInput? = nil, viewCount: ModelIntInput? = nil, thumbnail: ModelStringInput? = nil, preview: ModelStringInput? = nil, segments: ModelStringInput? = nil, and: [ModelUserContentConditionInput?]? = nil, or: [ModelUserContentConditionInput?]? = nil, not: ModelUserContentConditionInput? = nil) {
    graphQLMap = ["CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "and": and, "or": or, "not": not]
  }

  public var creatorId: ModelIDInput? {
    get {
      return graphQLMap["CreatorID"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "CreatorID")
    }
  }

  public var contentName: ModelStringInput? {
    get {
      return graphQLMap["ContentName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ContentName")
    }
  }

  public var description: ModelStringInput? {
    get {
      return graphQLMap["Description"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var title: ModelStringInput? {
    get {
      return graphQLMap["Title"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Title")
    }
  }

  public var level: ModelIntInput? {
    get {
      return graphQLMap["Level"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Level")
    }
  }

  public var length: ModelFloatInput? {
    get {
      return graphQLMap["Length"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Length")
    }
  }

  public var isDemo: ModelBooleanInput? {
    get {
      return graphQLMap["IsDemo"] as! ModelBooleanInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "IsDemo")
    }
  }

  public var transcodeReady: ModelBooleanInput? {
    get {
      return graphQLMap["TranscodeReady"] as! ModelBooleanInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "TranscodeReady")
    }
  }

  public var viewCount: ModelIntInput? {
    get {
      return graphQLMap["ViewCount"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ViewCount")
    }
  }

  public var thumbnail: ModelStringInput? {
    get {
      return graphQLMap["Thumbnail"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Thumbnail")
    }
  }

  public var preview: ModelStringInput? {
    get {
      return graphQLMap["Preview"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Preview")
    }
  }

  public var segments: ModelStringInput? {
    get {
      return graphQLMap["Segments"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Segments")
    }
  }

  public var and: [ModelUserContentConditionInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserContentConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserContentConditionInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserContentConditionInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserContentConditionInput? {
    get {
      return graphQLMap["not"] as! ModelUserContentConditionInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelIDInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, eq: GraphQLID? = nil, le: GraphQLID? = nil, lt: GraphQLID? = nil, ge: GraphQLID? = nil, gt: GraphQLID? = nil, contains: GraphQLID? = nil, notContains: GraphQLID? = nil, between: [GraphQLID?]? = nil, beginsWith: GraphQLID? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil, size: ModelSizeInput? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "contains": contains, "notContains": notContains, "between": between, "beginsWith": beginsWith, "attributeExists": attributeExists, "attributeType": attributeType, "size": size]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: GraphQLID? {
    get {
      return graphQLMap["le"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: GraphQLID? {
    get {
      return graphQLMap["ge"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var contains: GraphQLID? {
    get {
      return graphQLMap["contains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "contains")
    }
  }

  public var notContains: GraphQLID? {
    get {
      return graphQLMap["notContains"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notContains")
    }
  }

  public var between: [GraphQLID?]? {
    get {
      return graphQLMap["between"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var beginsWith: GraphQLID? {
    get {
      return graphQLMap["beginsWith"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "beginsWith")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }

  public var size: ModelSizeInput? {
    get {
      return graphQLMap["size"] as! ModelSizeInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "size")
    }
  }
}

public struct ModelIntInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Int? = nil, eq: Int? = nil, le: Int? = nil, lt: Int? = nil, ge: Int? = nil, gt: Int? = nil, between: [Int?]? = nil, attributeExists: Bool? = nil, attributeType: ModelAttributeTypes? = nil) {
    graphQLMap = ["ne": ne, "eq": eq, "le": le, "lt": lt, "ge": ge, "gt": gt, "between": between, "attributeExists": attributeExists, "attributeType": attributeType]
  }

  public var ne: Int? {
    get {
      return graphQLMap["ne"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var eq: Int? {
    get {
      return graphQLMap["eq"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var le: Int? {
    get {
      return graphQLMap["le"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "le")
    }
  }

  public var lt: Int? {
    get {
      return graphQLMap["lt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var ge: Int? {
    get {
      return graphQLMap["ge"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ge")
    }
  }

  public var gt: Int? {
    get {
      return graphQLMap["gt"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var between: [Int?]? {
    get {
      return graphQLMap["between"] as! [Int?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "between")
    }
  }

  public var attributeExists: Bool? {
    get {
      return graphQLMap["attributeExists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeExists")
    }
  }

  public var attributeType: ModelAttributeTypes? {
    get {
      return graphQLMap["attributeType"] as! ModelAttributeTypes?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "attributeType")
    }
  }
}

public struct UpdateUserContentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID, creatorId: GraphQLID? = nil, contentName: String? = nil, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil) {
    graphQLMap = ["id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var creatorId: GraphQLID? {
    get {
      return graphQLMap["CreatorID"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "CreatorID")
    }
  }

  public var contentName: String? {
    get {
      return graphQLMap["ContentName"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ContentName")
    }
  }

  public var description: String? {
    get {
      return graphQLMap["Description"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var title: String? {
    get {
      return graphQLMap["Title"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Title")
    }
  }

  public var level: Int? {
    get {
      return graphQLMap["Level"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Level")
    }
  }

  public var length: Double? {
    get {
      return graphQLMap["Length"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Length")
    }
  }

  public var isDemo: Bool? {
    get {
      return graphQLMap["IsDemo"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "IsDemo")
    }
  }

  public var transcodeReady: Bool? {
    get {
      return graphQLMap["TranscodeReady"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "TranscodeReady")
    }
  }

  public var viewCount: Int? {
    get {
      return graphQLMap["ViewCount"] as! Int?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ViewCount")
    }
  }

  public var thumbnail: String? {
    get {
      return graphQLMap["Thumbnail"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Thumbnail")
    }
  }

  public var preview: String? {
    get {
      return graphQLMap["Preview"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Preview")
    }
  }

  public var segments: String? {
    get {
      return graphQLMap["Segments"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Segments")
    }
  }
}

public struct DeleteUserContentInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: GraphQLID) {
    graphQLMap = ["id": id]
  }

  public var id: GraphQLID {
    get {
      return graphQLMap["id"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }
}

public struct ModelUserProfileFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, birthday: ModelStringInput? = nil, email: ModelStringInput? = nil, gender: ModelStringInput? = nil, height: ModelFloatInput? = nil, regDate: ModelStringInput? = nil, stripeId: ModelStringInput? = nil, userImage: ModelStringInput? = nil, bgImage: ModelStringInput? = nil, bgTitle: ModelStringInput? = nil, lastName: ModelStringInput? = nil, firstName: ModelStringInput? = nil, userRole: ModelStringInput? = nil, weight: ModelFloatInput? = nil, description: ModelStringInput? = nil, biography: ModelStringInput? = nil, and: [ModelUserProfileFilterInput?]? = nil, or: [ModelUserProfileFilterInput?]? = nil, not: ModelUserProfileFilterInput? = nil) {
    graphQLMap = ["id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var birthday: ModelStringInput? {
    get {
      return graphQLMap["Birthday"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Birthday")
    }
  }

  public var email: ModelStringInput? {
    get {
      return graphQLMap["Email"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Email")
    }
  }

  public var gender: ModelStringInput? {
    get {
      return graphQLMap["Gender"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Gender")
    }
  }

  public var height: ModelFloatInput? {
    get {
      return graphQLMap["Height"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Height")
    }
  }

  public var regDate: ModelStringInput? {
    get {
      return graphQLMap["RegDate"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "RegDate")
    }
  }

  public var stripeId: ModelStringInput? {
    get {
      return graphQLMap["StripeID"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var userImage: ModelStringInput? {
    get {
      return graphQLMap["UserImage"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserImage")
    }
  }

  public var bgImage: ModelStringInput? {
    get {
      return graphQLMap["BgImage"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgImage")
    }
  }

  public var bgTitle: ModelStringInput? {
    get {
      return graphQLMap["BgTitle"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgTitle")
    }
  }

  public var lastName: ModelStringInput? {
    get {
      return graphQLMap["LastName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "LastName")
    }
  }

  public var firstName: ModelStringInput? {
    get {
      return graphQLMap["FirstName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "FirstName")
    }
  }

  public var userRole: ModelStringInput? {
    get {
      return graphQLMap["UserRole"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserRole")
    }
  }

  public var weight: ModelFloatInput? {
    get {
      return graphQLMap["Weight"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Weight")
    }
  }

  public var description: ModelStringInput? {
    get {
      return graphQLMap["Description"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var biography: ModelStringInput? {
    get {
      return graphQLMap["Biography"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Biography")
    }
  }

  public var and: [ModelUserProfileFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserProfileFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserProfileFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserProfileFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserProfileFilterInput? {
    get {
      return graphQLMap["not"] as! ModelUserProfileFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public enum ModelSortDirection: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case asc
  case desc
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ASC": self = .asc
      case "DESC": self = .desc
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .asc: return "ASC"
      case .desc: return "DESC"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: ModelSortDirection, rhs: ModelSortDirection) -> Bool {
    switch (lhs, rhs) {
      case (.asc, .asc): return true
      case (.desc, .desc): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct SearchableUserProfileFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: SearchableIDFilterInput? = nil, birthday: SearchableStringFilterInput? = nil, email: SearchableStringFilterInput? = nil, gender: SearchableStringFilterInput? = nil, height: SearchableFloatFilterInput? = nil, regDate: SearchableStringFilterInput? = nil, stripeId: SearchableStringFilterInput? = nil, userImage: SearchableStringFilterInput? = nil, bgImage: SearchableStringFilterInput? = nil, bgTitle: SearchableStringFilterInput? = nil, lastName: SearchableStringFilterInput? = nil, firstName: SearchableStringFilterInput? = nil, userRole: SearchableStringFilterInput? = nil, weight: SearchableFloatFilterInput? = nil, description: SearchableStringFilterInput? = nil, biography: SearchableStringFilterInput? = nil, and: [SearchableUserProfileFilterInput?]? = nil, or: [SearchableUserProfileFilterInput?]? = nil, not: SearchableUserProfileFilterInput? = nil) {
    graphQLMap = ["id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "and": and, "or": or, "not": not]
  }

  public var id: SearchableIDFilterInput? {
    get {
      return graphQLMap["id"] as! SearchableIDFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var birthday: SearchableStringFilterInput? {
    get {
      return graphQLMap["Birthday"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Birthday")
    }
  }

  public var email: SearchableStringFilterInput? {
    get {
      return graphQLMap["Email"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Email")
    }
  }

  public var gender: SearchableStringFilterInput? {
    get {
      return graphQLMap["Gender"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Gender")
    }
  }

  public var height: SearchableFloatFilterInput? {
    get {
      return graphQLMap["Height"] as! SearchableFloatFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Height")
    }
  }

  public var regDate: SearchableStringFilterInput? {
    get {
      return graphQLMap["RegDate"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "RegDate")
    }
  }

  public var stripeId: SearchableStringFilterInput? {
    get {
      return graphQLMap["StripeID"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var userImage: SearchableStringFilterInput? {
    get {
      return graphQLMap["UserImage"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserImage")
    }
  }

  public var bgImage: SearchableStringFilterInput? {
    get {
      return graphQLMap["BgImage"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgImage")
    }
  }

  public var bgTitle: SearchableStringFilterInput? {
    get {
      return graphQLMap["BgTitle"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "BgTitle")
    }
  }

  public var lastName: SearchableStringFilterInput? {
    get {
      return graphQLMap["LastName"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "LastName")
    }
  }

  public var firstName: SearchableStringFilterInput? {
    get {
      return graphQLMap["FirstName"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "FirstName")
    }
  }

  public var userRole: SearchableStringFilterInput? {
    get {
      return graphQLMap["UserRole"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "UserRole")
    }
  }

  public var weight: SearchableFloatFilterInput? {
    get {
      return graphQLMap["Weight"] as! SearchableFloatFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Weight")
    }
  }

  public var description: SearchableStringFilterInput? {
    get {
      return graphQLMap["Description"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var biography: SearchableStringFilterInput? {
    get {
      return graphQLMap["Biography"] as! SearchableStringFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Biography")
    }
  }

  public var and: [SearchableUserProfileFilterInput?]? {
    get {
      return graphQLMap["and"] as! [SearchableUserProfileFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [SearchableUserProfileFilterInput?]? {
    get {
      return graphQLMap["or"] as! [SearchableUserProfileFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: SearchableUserProfileFilterInput? {
    get {
      return graphQLMap["not"] as! SearchableUserProfileFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct SearchableIDFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: GraphQLID? = nil, gt: GraphQLID? = nil, lt: GraphQLID? = nil, gte: GraphQLID? = nil, lte: GraphQLID? = nil, eq: GraphQLID? = nil, match: GraphQLID? = nil, matchPhrase: GraphQLID? = nil, matchPhrasePrefix: GraphQLID? = nil, multiMatch: GraphQLID? = nil, exists: Bool? = nil, wildcard: GraphQLID? = nil, regexp: GraphQLID? = nil, range: [GraphQLID?]? = nil) {
    graphQLMap = ["ne": ne, "gt": gt, "lt": lt, "gte": gte, "lte": lte, "eq": eq, "match": match, "matchPhrase": matchPhrase, "matchPhrasePrefix": matchPhrasePrefix, "multiMatch": multiMatch, "exists": exists, "wildcard": wildcard, "regexp": regexp, "range": range]
  }

  public var ne: GraphQLID? {
    get {
      return graphQLMap["ne"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var gt: GraphQLID? {
    get {
      return graphQLMap["gt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var lt: GraphQLID? {
    get {
      return graphQLMap["lt"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var gte: GraphQLID? {
    get {
      return graphQLMap["gte"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gte")
    }
  }

  public var lte: GraphQLID? {
    get {
      return graphQLMap["lte"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lte")
    }
  }

  public var eq: GraphQLID? {
    get {
      return graphQLMap["eq"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var match: GraphQLID? {
    get {
      return graphQLMap["match"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "match")
    }
  }

  public var matchPhrase: GraphQLID? {
    get {
      return graphQLMap["matchPhrase"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "matchPhrase")
    }
  }

  public var matchPhrasePrefix: GraphQLID? {
    get {
      return graphQLMap["matchPhrasePrefix"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "matchPhrasePrefix")
    }
  }

  public var multiMatch: GraphQLID? {
    get {
      return graphQLMap["multiMatch"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "multiMatch")
    }
  }

  public var exists: Bool? {
    get {
      return graphQLMap["exists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "exists")
    }
  }

  public var wildcard: GraphQLID? {
    get {
      return graphQLMap["wildcard"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "wildcard")
    }
  }

  public var regexp: GraphQLID? {
    get {
      return graphQLMap["regexp"] as! GraphQLID?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "regexp")
    }
  }

  public var range: [GraphQLID?]? {
    get {
      return graphQLMap["range"] as! [GraphQLID?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "range")
    }
  }
}

public struct SearchableStringFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: String? = nil, gt: String? = nil, lt: String? = nil, gte: String? = nil, lte: String? = nil, eq: String? = nil, match: String? = nil, matchPhrase: String? = nil, matchPhrasePrefix: String? = nil, multiMatch: String? = nil, exists: Bool? = nil, wildcard: String? = nil, regexp: String? = nil, range: [String?]? = nil) {
    graphQLMap = ["ne": ne, "gt": gt, "lt": lt, "gte": gte, "lte": lte, "eq": eq, "match": match, "matchPhrase": matchPhrase, "matchPhrasePrefix": matchPhrasePrefix, "multiMatch": multiMatch, "exists": exists, "wildcard": wildcard, "regexp": regexp, "range": range]
  }

  public var ne: String? {
    get {
      return graphQLMap["ne"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var gt: String? {
    get {
      return graphQLMap["gt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var lt: String? {
    get {
      return graphQLMap["lt"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var gte: String? {
    get {
      return graphQLMap["gte"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gte")
    }
  }

  public var lte: String? {
    get {
      return graphQLMap["lte"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lte")
    }
  }

  public var eq: String? {
    get {
      return graphQLMap["eq"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var match: String? {
    get {
      return graphQLMap["match"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "match")
    }
  }

  public var matchPhrase: String? {
    get {
      return graphQLMap["matchPhrase"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "matchPhrase")
    }
  }

  public var matchPhrasePrefix: String? {
    get {
      return graphQLMap["matchPhrasePrefix"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "matchPhrasePrefix")
    }
  }

  public var multiMatch: String? {
    get {
      return graphQLMap["multiMatch"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "multiMatch")
    }
  }

  public var exists: Bool? {
    get {
      return graphQLMap["exists"] as! Bool?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "exists")
    }
  }

  public var wildcard: String? {
    get {
      return graphQLMap["wildcard"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "wildcard")
    }
  }

  public var regexp: String? {
    get {
      return graphQLMap["regexp"] as! String?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "regexp")
    }
  }

  public var range: [String?]? {
    get {
      return graphQLMap["range"] as! [String?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "range")
    }
  }
}

public struct SearchableFloatFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(ne: Double? = nil, gt: Double? = nil, lt: Double? = nil, gte: Double? = nil, lte: Double? = nil, eq: Double? = nil, range: [Double?]? = nil) {
    graphQLMap = ["ne": ne, "gt": gt, "lt": lt, "gte": gte, "lte": lte, "eq": eq, "range": range]
  }

  public var ne: Double? {
    get {
      return graphQLMap["ne"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ne")
    }
  }

  public var gt: Double? {
    get {
      return graphQLMap["gt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gt")
    }
  }

  public var lt: Double? {
    get {
      return graphQLMap["lt"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lt")
    }
  }

  public var gte: Double? {
    get {
      return graphQLMap["gte"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gte")
    }
  }

  public var lte: Double? {
    get {
      return graphQLMap["lte"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lte")
    }
  }

  public var eq: Double? {
    get {
      return graphQLMap["eq"] as! Double?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eq")
    }
  }

  public var range: [Double?]? {
    get {
      return graphQLMap["range"] as! [Double?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "range")
    }
  }
}

public struct SearchableUserProfileSortInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(field: SearchableUserProfileSortableFields? = nil, direction: SearchableSortDirection? = nil) {
    graphQLMap = ["field": field, "direction": direction]
  }

  public var field: SearchableUserProfileSortableFields? {
    get {
      return graphQLMap["field"] as! SearchableUserProfileSortableFields?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "field")
    }
  }

  public var direction: SearchableSortDirection? {
    get {
      return graphQLMap["direction"] as! SearchableSortDirection?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "direction")
    }
  }
}

public enum SearchableUserProfileSortableFields: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case id
  case birthday
  case email
  case gender
  case height
  case regDate
  case stripeId
  case userImage
  case bgImage
  case bgTitle
  case lastName
  case firstName
  case userRole
  case weight
  case description
  case biography
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "id": self = .id
      case "Birthday": self = .birthday
      case "Email": self = .email
      case "Gender": self = .gender
      case "Height": self = .height
      case "RegDate": self = .regDate
      case "StripeID": self = .stripeId
      case "UserImage": self = .userImage
      case "BgImage": self = .bgImage
      case "BgTitle": self = .bgTitle
      case "LastName": self = .lastName
      case "FirstName": self = .firstName
      case "UserRole": self = .userRole
      case "Weight": self = .weight
      case "Description": self = .description
      case "Biography": self = .biography
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .id: return "id"
      case .birthday: return "Birthday"
      case .email: return "Email"
      case .gender: return "Gender"
      case .height: return "Height"
      case .regDate: return "RegDate"
      case .stripeId: return "StripeID"
      case .userImage: return "UserImage"
      case .bgImage: return "BgImage"
      case .bgTitle: return "BgTitle"
      case .lastName: return "LastName"
      case .firstName: return "FirstName"
      case .userRole: return "UserRole"
      case .weight: return "Weight"
      case .description: return "Description"
      case .biography: return "Biography"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: SearchableUserProfileSortableFields, rhs: SearchableUserProfileSortableFields) -> Bool {
    switch (lhs, rhs) {
      case (.id, .id): return true
      case (.birthday, .birthday): return true
      case (.email, .email): return true
      case (.gender, .gender): return true
      case (.height, .height): return true
      case (.regDate, .regDate): return true
      case (.stripeId, .stripeId): return true
      case (.userImage, .userImage): return true
      case (.bgImage, .bgImage): return true
      case (.bgTitle, .bgTitle): return true
      case (.lastName, .lastName): return true
      case (.firstName, .firstName): return true
      case (.userRole, .userRole): return true
      case (.weight, .weight): return true
      case (.description, .description): return true
      case (.biography, .biography): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public enum SearchableSortDirection: RawRepresentable, Equatable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  case asc
  case desc
  /// Auto generated constant for unknown enum values
  case unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "asc": self = .asc
      case "desc": self = .desc
      default: self = .unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .asc: return "asc"
      case .desc: return "desc"
      case .unknown(let value): return value
    }
  }

  public static func == (lhs: SearchableSortDirection, rhs: SearchableSortDirection) -> Bool {
    switch (lhs, rhs) {
      case (.asc, .asc): return true
      case (.desc, .desc): return true
      case (.unknown(let lhsValue), .unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public struct ModelUserSubscriptionTrainerFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, stripeId: ModelStringInput? = nil, expireDate: ModelStringInput? = nil, cancelAtPeriodEnd: ModelBooleanInput? = nil, and: [ModelUserSubscriptionTrainerFilterInput?]? = nil, or: [ModelUserSubscriptionTrainerFilterInput?]? = nil, not: ModelUserSubscriptionTrainerFilterInput? = nil) {
    graphQLMap = ["id": id, "StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var stripeId: ModelStringInput? {
    get {
      return graphQLMap["StripeID"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "StripeID")
    }
  }

  public var expireDate: ModelStringInput? {
    get {
      return graphQLMap["ExpireDate"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ExpireDate")
    }
  }

  public var cancelAtPeriodEnd: ModelBooleanInput? {
    get {
      return graphQLMap["CancelAtPeriodEnd"] as! ModelBooleanInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "CancelAtPeriodEnd")
    }
  }

  public var and: [ModelUserSubscriptionTrainerFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserSubscriptionTrainerFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserSubscriptionTrainerFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserSubscriptionTrainerFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserSubscriptionTrainerFilterInput? {
    get {
      return graphQLMap["not"] as! ModelUserSubscriptionTrainerFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public struct ModelUserContentFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  public init(id: ModelIDInput? = nil, creatorId: ModelIDInput? = nil, contentName: ModelStringInput? = nil, description: ModelStringInput? = nil, title: ModelStringInput? = nil, level: ModelIntInput? = nil, length: ModelFloatInput? = nil, isDemo: ModelBooleanInput? = nil, transcodeReady: ModelBooleanInput? = nil, viewCount: ModelIntInput? = nil, thumbnail: ModelStringInput? = nil, preview: ModelStringInput? = nil, segments: ModelStringInput? = nil, and: [ModelUserContentFilterInput?]? = nil, or: [ModelUserContentFilterInput?]? = nil, not: ModelUserContentFilterInput? = nil) {
    graphQLMap = ["id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "and": and, "or": or, "not": not]
  }

  public var id: ModelIDInput? {
    get {
      return graphQLMap["id"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "id")
    }
  }

  public var creatorId: ModelIDInput? {
    get {
      return graphQLMap["CreatorID"] as! ModelIDInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "CreatorID")
    }
  }

  public var contentName: ModelStringInput? {
    get {
      return graphQLMap["ContentName"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ContentName")
    }
  }

  public var description: ModelStringInput? {
    get {
      return graphQLMap["Description"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Description")
    }
  }

  public var title: ModelStringInput? {
    get {
      return graphQLMap["Title"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Title")
    }
  }

  public var level: ModelIntInput? {
    get {
      return graphQLMap["Level"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Level")
    }
  }

  public var length: ModelFloatInput? {
    get {
      return graphQLMap["Length"] as! ModelFloatInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Length")
    }
  }

  public var isDemo: ModelBooleanInput? {
    get {
      return graphQLMap["IsDemo"] as! ModelBooleanInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "IsDemo")
    }
  }

  public var transcodeReady: ModelBooleanInput? {
    get {
      return graphQLMap["TranscodeReady"] as! ModelBooleanInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "TranscodeReady")
    }
  }

  public var viewCount: ModelIntInput? {
    get {
      return graphQLMap["ViewCount"] as! ModelIntInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ViewCount")
    }
  }

  public var thumbnail: ModelStringInput? {
    get {
      return graphQLMap["Thumbnail"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Thumbnail")
    }
  }

  public var preview: ModelStringInput? {
    get {
      return graphQLMap["Preview"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Preview")
    }
  }

  public var segments: ModelStringInput? {
    get {
      return graphQLMap["Segments"] as! ModelStringInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "Segments")
    }
  }

  public var and: [ModelUserContentFilterInput?]? {
    get {
      return graphQLMap["and"] as! [ModelUserContentFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "and")
    }
  }

  public var or: [ModelUserContentFilterInput?]? {
    get {
      return graphQLMap["or"] as! [ModelUserContentFilterInput?]?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "or")
    }
  }

  public var not: ModelUserContentFilterInput? {
    get {
      return graphQLMap["not"] as! ModelUserContentFilterInput?
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "not")
    }
  }
}

public final class CreateUserProfileMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUserProfile($input: CreateUserProfileInput!, $condition: ModelUserProfileConditionInput) {\n  createUserProfile(input: $input, condition: $condition) {\n    __typename\n    id\n    Birthday\n    Email\n    Gender\n    Height\n    RegDate\n    StripeID\n    UserImage\n    BgImage\n    BgTitle\n    LastName\n    FirstName\n    UserRole\n    Weight\n    Description\n    Biography\n    createdAt\n    updatedAt\n    owner\n    Subscriptions {\n      __typename\n      nextToken\n    }\n    Users {\n      __typename\n      nextToken\n    }\n    Favorites {\n      __typename\n      nextToken\n    }\n    Contents {\n      __typename\n      nextToken\n    }\n  }\n}"

  public var input: CreateUserProfileInput
  public var condition: ModelUserProfileConditionInput?

  public init(input: CreateUserProfileInput, condition: ModelUserProfileConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUserProfile", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateUserProfile.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUserProfile: CreateUserProfile? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUserProfile": createUserProfile.flatMap { $0.snapshot }])
    }

    public var createUserProfile: CreateUserProfile? {
      get {
        return (snapshot["createUserProfile"] as? Snapshot).flatMap { CreateUserProfile(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUserProfile")
      }
    }

    public struct CreateUserProfile: GraphQLSelectionSet {
      public static let possibleTypes = ["UserProfile"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("Birthday", type: .scalar(String.self)),
        GraphQLField("Email", type: .scalar(String.self)),
        GraphQLField("Gender", type: .scalar(String.self)),
        GraphQLField("Height", type: .scalar(Double.self)),
        GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("StripeID", type: .scalar(String.self)),
        GraphQLField("UserImage", type: .scalar(String.self)),
        GraphQLField("BgImage", type: .scalar(String.self)),
        GraphQLField("BgTitle", type: .scalar(String.self)),
        GraphQLField("LastName", type: .scalar(String.self)),
        GraphQLField("FirstName", type: .scalar(String.self)),
        GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
        GraphQLField("Weight", type: .scalar(Double.self)),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Biography", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("Subscriptions", type: .object(Subscription.selections)),
        GraphQLField("Users", type: .object(User.selections)),
        GraphQLField("Favorites", type: .object(Favorite.selections)),
        GraphQLField("Contents", type: .object(Content.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil, subscriptions: Subscription? = nil, users: User? = nil, favorites: Favorite? = nil, contents: Content? = nil) {
        self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner, "Subscriptions": subscriptions.flatMap { $0.snapshot }, "Users": users.flatMap { $0.snapshot }, "Favorites": favorites.flatMap { $0.snapshot }, "Contents": contents.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var birthday: String? {
        get {
          return snapshot["Birthday"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Birthday")
        }
      }

      public var email: String? {
        get {
          return snapshot["Email"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Email")
        }
      }

      public var gender: String? {
        get {
          return snapshot["Gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Gender")
        }
      }

      public var height: Double? {
        get {
          return snapshot["Height"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Height")
        }
      }

      public var regDate: String {
        get {
          return snapshot["RegDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "RegDate")
        }
      }

      public var stripeId: String? {
        get {
          return snapshot["StripeID"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "StripeID")
        }
      }

      public var userImage: String? {
        get {
          return snapshot["UserImage"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "UserImage")
        }
      }

      public var bgImage: String? {
        get {
          return snapshot["BgImage"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "BgImage")
        }
      }

      public var bgTitle: String? {
        get {
          return snapshot["BgTitle"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "BgTitle")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["LastName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "LastName")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["FirstName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "FirstName")
        }
      }

      public var userRole: String {
        get {
          return snapshot["UserRole"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "UserRole")
        }
      }

      public var weight: Double? {
        get {
          return snapshot["Weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Weight")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var biography: String? {
        get {
          return snapshot["Biography"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Biography")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public var subscriptions: Subscription? {
        get {
          return (snapshot["Subscriptions"] as? Snapshot).flatMap { Subscription(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Subscriptions")
        }
      }

      public var users: User? {
        get {
          return (snapshot["Users"] as? Snapshot).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Users")
        }
      }

      public var favorites: Favorite? {
        get {
          return (snapshot["Favorites"] as? Snapshot).flatMap { Favorite(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Favorites")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["Contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Contents")
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct Favorite: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}

public final class UpdateUserProfileMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUserProfile($input: UpdateUserProfileInput!, $condition: ModelUserProfileConditionInput) {\n  updateUserProfile(input: $input, condition: $condition) {\n    __typename\n    id\n    Birthday\n    Email\n    Gender\n    Height\n    RegDate\n    StripeID\n    UserImage\n    BgImage\n    BgTitle\n    LastName\n    FirstName\n    UserRole\n    Weight\n    Description\n    Biography\n    createdAt\n    updatedAt\n    owner\n    Subscriptions {\n      __typename\n      nextToken\n    }\n    Users {\n      __typename\n      nextToken\n    }\n    Favorites {\n      __typename\n      nextToken\n    }\n    Contents {\n      __typename\n      nextToken\n    }\n  }\n}"

  public var input: UpdateUserProfileInput
  public var condition: ModelUserProfileConditionInput?

  public init(input: UpdateUserProfileInput, condition: ModelUserProfileConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUserProfile", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateUserProfile.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUserProfile: UpdateUserProfile? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUserProfile": updateUserProfile.flatMap { $0.snapshot }])
    }

    public var updateUserProfile: UpdateUserProfile? {
      get {
        return (snapshot["updateUserProfile"] as? Snapshot).flatMap { UpdateUserProfile(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUserProfile")
      }
    }

    public struct UpdateUserProfile: GraphQLSelectionSet {
      public static let possibleTypes = ["UserProfile"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("Birthday", type: .scalar(String.self)),
        GraphQLField("Email", type: .scalar(String.self)),
        GraphQLField("Gender", type: .scalar(String.self)),
        GraphQLField("Height", type: .scalar(Double.self)),
        GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("StripeID", type: .scalar(String.self)),
        GraphQLField("UserImage", type: .scalar(String.self)),
        GraphQLField("BgImage", type: .scalar(String.self)),
        GraphQLField("BgTitle", type: .scalar(String.self)),
        GraphQLField("LastName", type: .scalar(String.self)),
        GraphQLField("FirstName", type: .scalar(String.self)),
        GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
        GraphQLField("Weight", type: .scalar(Double.self)),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Biography", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("Subscriptions", type: .object(Subscription.selections)),
        GraphQLField("Users", type: .object(User.selections)),
        GraphQLField("Favorites", type: .object(Favorite.selections)),
        GraphQLField("Contents", type: .object(Content.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil, subscriptions: Subscription? = nil, users: User? = nil, favorites: Favorite? = nil, contents: Content? = nil) {
        self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner, "Subscriptions": subscriptions.flatMap { $0.snapshot }, "Users": users.flatMap { $0.snapshot }, "Favorites": favorites.flatMap { $0.snapshot }, "Contents": contents.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var birthday: String? {
        get {
          return snapshot["Birthday"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Birthday")
        }
      }

      public var email: String? {
        get {
          return snapshot["Email"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Email")
        }
      }

      public var gender: String? {
        get {
          return snapshot["Gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Gender")
        }
      }

      public var height: Double? {
        get {
          return snapshot["Height"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Height")
        }
      }

      public var regDate: String {
        get {
          return snapshot["RegDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "RegDate")
        }
      }

      public var stripeId: String? {
        get {
          return snapshot["StripeID"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "StripeID")
        }
      }

      public var userImage: String? {
        get {
          return snapshot["UserImage"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "UserImage")
        }
      }

      public var bgImage: String? {
        get {
          return snapshot["BgImage"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "BgImage")
        }
      }

      public var bgTitle: String? {
        get {
          return snapshot["BgTitle"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "BgTitle")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["LastName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "LastName")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["FirstName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "FirstName")
        }
      }

      public var userRole: String {
        get {
          return snapshot["UserRole"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "UserRole")
        }
      }

      public var weight: Double? {
        get {
          return snapshot["Weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Weight")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var biography: String? {
        get {
          return snapshot["Biography"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Biography")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public var subscriptions: Subscription? {
        get {
          return (snapshot["Subscriptions"] as? Snapshot).flatMap { Subscription(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Subscriptions")
        }
      }

      public var users: User? {
        get {
          return (snapshot["Users"] as? Snapshot).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Users")
        }
      }

      public var favorites: Favorite? {
        get {
          return (snapshot["Favorites"] as? Snapshot).flatMap { Favorite(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Favorites")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["Contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Contents")
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct Favorite: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}

public final class DeleteUserProfileMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUserProfile($input: DeleteUserProfileInput!, $condition: ModelUserProfileConditionInput) {\n  deleteUserProfile(input: $input, condition: $condition) {\n    __typename\n    id\n    Birthday\n    Email\n    Gender\n    Height\n    RegDate\n    StripeID\n    UserImage\n    BgImage\n    BgTitle\n    LastName\n    FirstName\n    UserRole\n    Weight\n    Description\n    Biography\n    createdAt\n    updatedAt\n    owner\n    Subscriptions {\n      __typename\n      nextToken\n    }\n    Users {\n      __typename\n      nextToken\n    }\n    Favorites {\n      __typename\n      nextToken\n    }\n    Contents {\n      __typename\n      nextToken\n    }\n  }\n}"

  public var input: DeleteUserProfileInput
  public var condition: ModelUserProfileConditionInput?

  public init(input: DeleteUserProfileInput, condition: ModelUserProfileConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUserProfile", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteUserProfile.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUserProfile: DeleteUserProfile? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUserProfile": deleteUserProfile.flatMap { $0.snapshot }])
    }

    public var deleteUserProfile: DeleteUserProfile? {
      get {
        return (snapshot["deleteUserProfile"] as? Snapshot).flatMap { DeleteUserProfile(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUserProfile")
      }
    }

    public struct DeleteUserProfile: GraphQLSelectionSet {
      public static let possibleTypes = ["UserProfile"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("Birthday", type: .scalar(String.self)),
        GraphQLField("Email", type: .scalar(String.self)),
        GraphQLField("Gender", type: .scalar(String.self)),
        GraphQLField("Height", type: .scalar(Double.self)),
        GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("StripeID", type: .scalar(String.self)),
        GraphQLField("UserImage", type: .scalar(String.self)),
        GraphQLField("BgImage", type: .scalar(String.self)),
        GraphQLField("BgTitle", type: .scalar(String.self)),
        GraphQLField("LastName", type: .scalar(String.self)),
        GraphQLField("FirstName", type: .scalar(String.self)),
        GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
        GraphQLField("Weight", type: .scalar(Double.self)),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Biography", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("Subscriptions", type: .object(Subscription.selections)),
        GraphQLField("Users", type: .object(User.selections)),
        GraphQLField("Favorites", type: .object(Favorite.selections)),
        GraphQLField("Contents", type: .object(Content.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil, subscriptions: Subscription? = nil, users: User? = nil, favorites: Favorite? = nil, contents: Content? = nil) {
        self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner, "Subscriptions": subscriptions.flatMap { $0.snapshot }, "Users": users.flatMap { $0.snapshot }, "Favorites": favorites.flatMap { $0.snapshot }, "Contents": contents.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var birthday: String? {
        get {
          return snapshot["Birthday"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Birthday")
        }
      }

      public var email: String? {
        get {
          return snapshot["Email"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Email")
        }
      }

      public var gender: String? {
        get {
          return snapshot["Gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Gender")
        }
      }

      public var height: Double? {
        get {
          return snapshot["Height"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Height")
        }
      }

      public var regDate: String {
        get {
          return snapshot["RegDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "RegDate")
        }
      }

      public var stripeId: String? {
        get {
          return snapshot["StripeID"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "StripeID")
        }
      }

      public var userImage: String? {
        get {
          return snapshot["UserImage"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "UserImage")
        }
      }

      public var bgImage: String? {
        get {
          return snapshot["BgImage"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "BgImage")
        }
      }

      public var bgTitle: String? {
        get {
          return snapshot["BgTitle"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "BgTitle")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["LastName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "LastName")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["FirstName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "FirstName")
        }
      }

      public var userRole: String {
        get {
          return snapshot["UserRole"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "UserRole")
        }
      }

      public var weight: Double? {
        get {
          return snapshot["Weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Weight")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var biography: String? {
        get {
          return snapshot["Biography"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Biography")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public var subscriptions: Subscription? {
        get {
          return (snapshot["Subscriptions"] as? Snapshot).flatMap { Subscription(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Subscriptions")
        }
      }

      public var users: User? {
        get {
          return (snapshot["Users"] as? Snapshot).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Users")
        }
      }

      public var favorites: Favorite? {
        get {
          return (snapshot["Favorites"] as? Snapshot).flatMap { Favorite(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Favorites")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["Contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Contents")
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct Favorite: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}

public final class CreateUserSubscriptionTrainerMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUserSubscriptionTrainer($input: CreateUserSubscriptionTrainerInput!, $condition: ModelUserSubscriptionTrainerConditionInput) {\n  createUserSubscriptionTrainer(input: $input, condition: $condition) {\n    __typename\n    id\n    StripeID\n    ExpireDate\n    CancelAtPeriodEnd\n    createdAt\n    updatedAt\n    Trainer {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    User {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    owner\n  }\n}"

  public var input: CreateUserSubscriptionTrainerInput
  public var condition: ModelUserSubscriptionTrainerConditionInput?

  public init(input: CreateUserSubscriptionTrainerInput, condition: ModelUserSubscriptionTrainerConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUserSubscriptionTrainer", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateUserSubscriptionTrainer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUserSubscriptionTrainer: CreateUserSubscriptionTrainer? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUserSubscriptionTrainer": createUserSubscriptionTrainer.flatMap { $0.snapshot }])
    }

    public var createUserSubscriptionTrainer: CreateUserSubscriptionTrainer? {
      get {
        return (snapshot["createUserSubscriptionTrainer"] as? Snapshot).flatMap { CreateUserSubscriptionTrainer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUserSubscriptionTrainer")
      }
    }

    public struct CreateUserSubscriptionTrainer: GraphQLSelectionSet {
      public static let possibleTypes = ["UserSubscriptionTrainer"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("StripeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("ExpireDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("CancelAtPeriodEnd", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Trainer", type: .nonNull(.object(Trainer.selections))),
        GraphQLField("User", type: .nonNull(.object(User.selections))),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, stripeId: String, expireDate: String, cancelAtPeriodEnd: Bool, createdAt: String, updatedAt: String, trainer: Trainer, user: User, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserSubscriptionTrainer", "id": id, "StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "createdAt": createdAt, "updatedAt": updatedAt, "Trainer": trainer.snapshot, "User": user.snapshot, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var stripeId: String {
        get {
          return snapshot["StripeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "StripeID")
        }
      }

      public var expireDate: String {
        get {
          return snapshot["ExpireDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ExpireDate")
        }
      }

      public var cancelAtPeriodEnd: Bool {
        get {
          return snapshot["CancelAtPeriodEnd"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "CancelAtPeriodEnd")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var trainer: Trainer {
        get {
          return Trainer(snapshot: snapshot["Trainer"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "Trainer")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["User"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "User")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Trainer: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class UpdateUserSubscriptionTrainerMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUserSubscriptionTrainer($input: UpdateUserSubscriptionTrainerInput!, $condition: ModelUserSubscriptionTrainerConditionInput) {\n  updateUserSubscriptionTrainer(input: $input, condition: $condition) {\n    __typename\n    id\n    StripeID\n    ExpireDate\n    CancelAtPeriodEnd\n    createdAt\n    updatedAt\n    Trainer {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    User {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    owner\n  }\n}"

  public var input: UpdateUserSubscriptionTrainerInput
  public var condition: ModelUserSubscriptionTrainerConditionInput?

  public init(input: UpdateUserSubscriptionTrainerInput, condition: ModelUserSubscriptionTrainerConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUserSubscriptionTrainer", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateUserSubscriptionTrainer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUserSubscriptionTrainer: UpdateUserSubscriptionTrainer? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUserSubscriptionTrainer": updateUserSubscriptionTrainer.flatMap { $0.snapshot }])
    }

    public var updateUserSubscriptionTrainer: UpdateUserSubscriptionTrainer? {
      get {
        return (snapshot["updateUserSubscriptionTrainer"] as? Snapshot).flatMap { UpdateUserSubscriptionTrainer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUserSubscriptionTrainer")
      }
    }

    public struct UpdateUserSubscriptionTrainer: GraphQLSelectionSet {
      public static let possibleTypes = ["UserSubscriptionTrainer"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("StripeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("ExpireDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("CancelAtPeriodEnd", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Trainer", type: .nonNull(.object(Trainer.selections))),
        GraphQLField("User", type: .nonNull(.object(User.selections))),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, stripeId: String, expireDate: String, cancelAtPeriodEnd: Bool, createdAt: String, updatedAt: String, trainer: Trainer, user: User, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserSubscriptionTrainer", "id": id, "StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "createdAt": createdAt, "updatedAt": updatedAt, "Trainer": trainer.snapshot, "User": user.snapshot, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var stripeId: String {
        get {
          return snapshot["StripeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "StripeID")
        }
      }

      public var expireDate: String {
        get {
          return snapshot["ExpireDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ExpireDate")
        }
      }

      public var cancelAtPeriodEnd: Bool {
        get {
          return snapshot["CancelAtPeriodEnd"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "CancelAtPeriodEnd")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var trainer: Trainer {
        get {
          return Trainer(snapshot: snapshot["Trainer"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "Trainer")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["User"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "User")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Trainer: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class DeleteUserSubscriptionTrainerMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUserSubscriptionTrainer($input: DeleteUserSubscriptionTrainerInput!, $condition: ModelUserSubscriptionTrainerConditionInput) {\n  deleteUserSubscriptionTrainer(input: $input, condition: $condition) {\n    __typename\n    id\n    StripeID\n    ExpireDate\n    CancelAtPeriodEnd\n    createdAt\n    updatedAt\n    Trainer {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    User {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    owner\n  }\n}"

  public var input: DeleteUserSubscriptionTrainerInput
  public var condition: ModelUserSubscriptionTrainerConditionInput?

  public init(input: DeleteUserSubscriptionTrainerInput, condition: ModelUserSubscriptionTrainerConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUserSubscriptionTrainer", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteUserSubscriptionTrainer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUserSubscriptionTrainer: DeleteUserSubscriptionTrainer? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUserSubscriptionTrainer": deleteUserSubscriptionTrainer.flatMap { $0.snapshot }])
    }

    public var deleteUserSubscriptionTrainer: DeleteUserSubscriptionTrainer? {
      get {
        return (snapshot["deleteUserSubscriptionTrainer"] as? Snapshot).flatMap { DeleteUserSubscriptionTrainer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUserSubscriptionTrainer")
      }
    }

    public struct DeleteUserSubscriptionTrainer: GraphQLSelectionSet {
      public static let possibleTypes = ["UserSubscriptionTrainer"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("StripeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("ExpireDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("CancelAtPeriodEnd", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Trainer", type: .nonNull(.object(Trainer.selections))),
        GraphQLField("User", type: .nonNull(.object(User.selections))),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, stripeId: String, expireDate: String, cancelAtPeriodEnd: Bool, createdAt: String, updatedAt: String, trainer: Trainer, user: User, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserSubscriptionTrainer", "id": id, "StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "createdAt": createdAt, "updatedAt": updatedAt, "Trainer": trainer.snapshot, "User": user.snapshot, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var stripeId: String {
        get {
          return snapshot["StripeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "StripeID")
        }
      }

      public var expireDate: String {
        get {
          return snapshot["ExpireDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ExpireDate")
        }
      }

      public var cancelAtPeriodEnd: Bool {
        get {
          return snapshot["CancelAtPeriodEnd"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "CancelAtPeriodEnd")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var trainer: Trainer {
        get {
          return Trainer(snapshot: snapshot["Trainer"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "Trainer")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["User"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "User")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Trainer: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class CreateUserFavoriteContentMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUserFavoriteContent($input: CreateUserFavoriteContentInput!, $condition: ModelUserFavoriteContentConditionInput) {\n  createUserFavoriteContent(input: $input, condition: $condition) {\n    __typename\n    id\n    createdAt\n    updatedAt\n    User {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    owner\n    Content {\n      __typename\n      id\n      CreatorID\n      ContentName\n      Description\n      Title\n      Level\n      Length\n      IsDemo\n      TranscodeReady\n      ViewCount\n      Thumbnail\n      Preview\n      Segments\n      createdAt\n      updatedAt\n      owner\n    }\n  }\n}"

  public var input: CreateUserFavoriteContentInput
  public var condition: ModelUserFavoriteContentConditionInput?

  public init(input: CreateUserFavoriteContentInput, condition: ModelUserFavoriteContentConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUserFavoriteContent", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateUserFavoriteContent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUserFavoriteContent: CreateUserFavoriteContent? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUserFavoriteContent": createUserFavoriteContent.flatMap { $0.snapshot }])
    }

    public var createUserFavoriteContent: CreateUserFavoriteContent? {
      get {
        return (snapshot["createUserFavoriteContent"] as? Snapshot).flatMap { CreateUserFavoriteContent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUserFavoriteContent")
      }
    }

    public struct CreateUserFavoriteContent: GraphQLSelectionSet {
      public static let possibleTypes = ["UserFavoriteContent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("User", type: .nonNull(.object(User.selections))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("Content", type: .nonNull(.object(Content.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, createdAt: String, updatedAt: String, user: User, owner: String? = nil, content: Content) {
        self.init(snapshot: ["__typename": "UserFavoriteContent", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "User": user.snapshot, "owner": owner, "Content": content.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["User"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "User")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public var content: Content {
        get {
          return Content(snapshot: snapshot["Content"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "Content")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["UserContent"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Title", type: .scalar(String.self)),
          GraphQLField("Level", type: .scalar(Int.self)),
          GraphQLField("Length", type: .scalar(Double.self)),
          GraphQLField("IsDemo", type: .scalar(Bool.self)),
          GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
          GraphQLField("ViewCount", type: .scalar(Int.self)),
          GraphQLField("Thumbnail", type: .scalar(String.self)),
          GraphQLField("Preview", type: .scalar(String.self)),
          GraphQLField("Segments", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The ID of the user who created and own this content
        public var creatorId: GraphQLID {
          get {
            return snapshot["CreatorID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "CreatorID")
          }
        }

        public var contentName: String {
          get {
            return snapshot["ContentName"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ContentName")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var title: String? {
          get {
            return snapshot["Title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Title")
          }
        }

        /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
        public var level: Int? {
          get {
            return snapshot["Level"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "Level")
          }
        }

        public var length: Double? {
          get {
            return snapshot["Length"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Length")
          }
        }

        public var isDemo: Bool? {
          get {
            return snapshot["IsDemo"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "IsDemo")
          }
        }

        public var transcodeReady: Bool? {
          get {
            return snapshot["TranscodeReady"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "TranscodeReady")
          }
        }

        public var viewCount: Int? {
          get {
            return snapshot["ViewCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ViewCount")
          }
        }

        public var thumbnail: String? {
          get {
            return snapshot["Thumbnail"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Thumbnail")
          }
        }

        public var preview: String? {
          get {
            return snapshot["Preview"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Preview")
          }
        }

        public var segments: String? {
          get {
            return snapshot["Segments"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Segments")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class UpdateUserFavoriteContentMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUserFavoriteContent($input: UpdateUserFavoriteContentInput!, $condition: ModelUserFavoriteContentConditionInput) {\n  updateUserFavoriteContent(input: $input, condition: $condition) {\n    __typename\n    id\n    createdAt\n    updatedAt\n    User {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    owner\n    Content {\n      __typename\n      id\n      CreatorID\n      ContentName\n      Description\n      Title\n      Level\n      Length\n      IsDemo\n      TranscodeReady\n      ViewCount\n      Thumbnail\n      Preview\n      Segments\n      createdAt\n      updatedAt\n      owner\n    }\n  }\n}"

  public var input: UpdateUserFavoriteContentInput
  public var condition: ModelUserFavoriteContentConditionInput?

  public init(input: UpdateUserFavoriteContentInput, condition: ModelUserFavoriteContentConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUserFavoriteContent", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateUserFavoriteContent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUserFavoriteContent: UpdateUserFavoriteContent? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUserFavoriteContent": updateUserFavoriteContent.flatMap { $0.snapshot }])
    }

    public var updateUserFavoriteContent: UpdateUserFavoriteContent? {
      get {
        return (snapshot["updateUserFavoriteContent"] as? Snapshot).flatMap { UpdateUserFavoriteContent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUserFavoriteContent")
      }
    }

    public struct UpdateUserFavoriteContent: GraphQLSelectionSet {
      public static let possibleTypes = ["UserFavoriteContent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("User", type: .nonNull(.object(User.selections))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("Content", type: .nonNull(.object(Content.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, createdAt: String, updatedAt: String, user: User, owner: String? = nil, content: Content) {
        self.init(snapshot: ["__typename": "UserFavoriteContent", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "User": user.snapshot, "owner": owner, "Content": content.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["User"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "User")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public var content: Content {
        get {
          return Content(snapshot: snapshot["Content"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "Content")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["UserContent"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Title", type: .scalar(String.self)),
          GraphQLField("Level", type: .scalar(Int.self)),
          GraphQLField("Length", type: .scalar(Double.self)),
          GraphQLField("IsDemo", type: .scalar(Bool.self)),
          GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
          GraphQLField("ViewCount", type: .scalar(Int.self)),
          GraphQLField("Thumbnail", type: .scalar(String.self)),
          GraphQLField("Preview", type: .scalar(String.self)),
          GraphQLField("Segments", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The ID of the user who created and own this content
        public var creatorId: GraphQLID {
          get {
            return snapshot["CreatorID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "CreatorID")
          }
        }

        public var contentName: String {
          get {
            return snapshot["ContentName"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ContentName")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var title: String? {
          get {
            return snapshot["Title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Title")
          }
        }

        /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
        public var level: Int? {
          get {
            return snapshot["Level"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "Level")
          }
        }

        public var length: Double? {
          get {
            return snapshot["Length"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Length")
          }
        }

        public var isDemo: Bool? {
          get {
            return snapshot["IsDemo"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "IsDemo")
          }
        }

        public var transcodeReady: Bool? {
          get {
            return snapshot["TranscodeReady"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "TranscodeReady")
          }
        }

        public var viewCount: Int? {
          get {
            return snapshot["ViewCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ViewCount")
          }
        }

        public var thumbnail: String? {
          get {
            return snapshot["Thumbnail"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Thumbnail")
          }
        }

        public var preview: String? {
          get {
            return snapshot["Preview"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Preview")
          }
        }

        public var segments: String? {
          get {
            return snapshot["Segments"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Segments")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class DeleteUserFavoriteContentMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUserFavoriteContent($input: DeleteUserFavoriteContentInput!, $condition: ModelUserFavoriteContentConditionInput) {\n  deleteUserFavoriteContent(input: $input, condition: $condition) {\n    __typename\n    id\n    createdAt\n    updatedAt\n    User {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    owner\n    Content {\n      __typename\n      id\n      CreatorID\n      ContentName\n      Description\n      Title\n      Level\n      Length\n      IsDemo\n      TranscodeReady\n      ViewCount\n      Thumbnail\n      Preview\n      Segments\n      createdAt\n      updatedAt\n      owner\n    }\n  }\n}"

  public var input: DeleteUserFavoriteContentInput
  public var condition: ModelUserFavoriteContentConditionInput?

  public init(input: DeleteUserFavoriteContentInput, condition: ModelUserFavoriteContentConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUserFavoriteContent", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteUserFavoriteContent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUserFavoriteContent: DeleteUserFavoriteContent? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUserFavoriteContent": deleteUserFavoriteContent.flatMap { $0.snapshot }])
    }

    public var deleteUserFavoriteContent: DeleteUserFavoriteContent? {
      get {
        return (snapshot["deleteUserFavoriteContent"] as? Snapshot).flatMap { DeleteUserFavoriteContent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUserFavoriteContent")
      }
    }

    public struct DeleteUserFavoriteContent: GraphQLSelectionSet {
      public static let possibleTypes = ["UserFavoriteContent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("User", type: .nonNull(.object(User.selections))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("Content", type: .nonNull(.object(Content.selections))),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, createdAt: String, updatedAt: String, user: User, owner: String? = nil, content: Content) {
        self.init(snapshot: ["__typename": "UserFavoriteContent", "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "User": user.snapshot, "owner": owner, "Content": content.snapshot])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["User"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "User")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public var content: Content {
        get {
          return Content(snapshot: snapshot["Content"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "Content")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["UserContent"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Title", type: .scalar(String.self)),
          GraphQLField("Level", type: .scalar(Int.self)),
          GraphQLField("Length", type: .scalar(Double.self)),
          GraphQLField("IsDemo", type: .scalar(Bool.self)),
          GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
          GraphQLField("ViewCount", type: .scalar(Int.self)),
          GraphQLField("Thumbnail", type: .scalar(String.self)),
          GraphQLField("Preview", type: .scalar(String.self)),
          GraphQLField("Segments", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The ID of the user who created and own this content
        public var creatorId: GraphQLID {
          get {
            return snapshot["CreatorID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "CreatorID")
          }
        }

        public var contentName: String {
          get {
            return snapshot["ContentName"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ContentName")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var title: String? {
          get {
            return snapshot["Title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Title")
          }
        }

        /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
        public var level: Int? {
          get {
            return snapshot["Level"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "Level")
          }
        }

        public var length: Double? {
          get {
            return snapshot["Length"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Length")
          }
        }

        public var isDemo: Bool? {
          get {
            return snapshot["IsDemo"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "IsDemo")
          }
        }

        public var transcodeReady: Bool? {
          get {
            return snapshot["TranscodeReady"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "TranscodeReady")
          }
        }

        public var viewCount: Int? {
          get {
            return snapshot["ViewCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ViewCount")
          }
        }

        public var thumbnail: String? {
          get {
            return snapshot["Thumbnail"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Thumbnail")
          }
        }

        public var preview: String? {
          get {
            return snapshot["Preview"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Preview")
          }
        }

        public var segments: String? {
          get {
            return snapshot["Segments"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Segments")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class CreateUserContentMutation: GraphQLMutation {
  public static let operationString =
    "mutation CreateUserContent($input: CreateUserContentInput!, $condition: ModelUserContentConditionInput) {\n  createUserContent(input: $input, condition: $condition) {\n    __typename\n    id\n    CreatorID\n    ContentName\n    Description\n    Title\n    Level\n    Length\n    IsDemo\n    TranscodeReady\n    ViewCount\n    Thumbnail\n    Preview\n    Segments\n    createdAt\n    updatedAt\n    Creator {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    FavoriteUser {\n      __typename\n      nextToken\n    }\n    owner\n  }\n}"

  public var input: CreateUserContentInput
  public var condition: ModelUserContentConditionInput?

  public init(input: CreateUserContentInput, condition: ModelUserContentConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createUserContent", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(CreateUserContent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(createUserContent: CreateUserContent? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "createUserContent": createUserContent.flatMap { $0.snapshot }])
    }

    public var createUserContent: CreateUserContent? {
      get {
        return (snapshot["createUserContent"] as? Snapshot).flatMap { CreateUserContent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "createUserContent")
      }
    }

    public struct CreateUserContent: GraphQLSelectionSet {
      public static let possibleTypes = ["UserContent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Title", type: .scalar(String.self)),
        GraphQLField("Level", type: .scalar(Int.self)),
        GraphQLField("Length", type: .scalar(Double.self)),
        GraphQLField("IsDemo", type: .scalar(Bool.self)),
        GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
        GraphQLField("ViewCount", type: .scalar(Int.self)),
        GraphQLField("Thumbnail", type: .scalar(String.self)),
        GraphQLField("Preview", type: .scalar(String.self)),
        GraphQLField("Segments", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Creator", type: .object(Creator.selections)),
        GraphQLField("FavoriteUser", type: .object(FavoriteUser.selections)),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, creator: Creator? = nil, favoriteUser: FavoriteUser? = nil, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "Creator": creator.flatMap { $0.snapshot }, "FavoriteUser": favoriteUser.flatMap { $0.snapshot }, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The ID of the user who created and own this content
      public var creatorId: GraphQLID {
        get {
          return snapshot["CreatorID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "CreatorID")
        }
      }

      public var contentName: String {
        get {
          return snapshot["ContentName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ContentName")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var title: String? {
        get {
          return snapshot["Title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Title")
        }
      }

      /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
      public var level: Int? {
        get {
          return snapshot["Level"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "Level")
        }
      }

      public var length: Double? {
        get {
          return snapshot["Length"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Length")
        }
      }

      public var isDemo: Bool? {
        get {
          return snapshot["IsDemo"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "IsDemo")
        }
      }

      public var transcodeReady: Bool? {
        get {
          return snapshot["TranscodeReady"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "TranscodeReady")
        }
      }

      public var viewCount: Int? {
        get {
          return snapshot["ViewCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ViewCount")
        }
      }

      public var thumbnail: String? {
        get {
          return snapshot["Thumbnail"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Thumbnail")
        }
      }

      public var preview: String? {
        get {
          return snapshot["Preview"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Preview")
        }
      }

      public var segments: String? {
        get {
          return snapshot["Segments"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Segments")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["Creator"] as? Snapshot).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Creator")
        }
      }

      public var favoriteUser: FavoriteUser? {
        get {
          return (snapshot["FavoriteUser"] as? Snapshot).flatMap { FavoriteUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "FavoriteUser")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct FavoriteUser: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}

public final class UpdateUserContentMutation: GraphQLMutation {
  public static let operationString =
    "mutation UpdateUserContent($input: UpdateUserContentInput!, $condition: ModelUserContentConditionInput) {\n  updateUserContent(input: $input, condition: $condition) {\n    __typename\n    id\n    CreatorID\n    ContentName\n    Description\n    Title\n    Level\n    Length\n    IsDemo\n    TranscodeReady\n    ViewCount\n    Thumbnail\n    Preview\n    Segments\n    createdAt\n    updatedAt\n    Creator {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    FavoriteUser {\n      __typename\n      nextToken\n    }\n    owner\n  }\n}"

  public var input: UpdateUserContentInput
  public var condition: ModelUserContentConditionInput?

  public init(input: UpdateUserContentInput, condition: ModelUserContentConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("updateUserContent", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(UpdateUserContent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(updateUserContent: UpdateUserContent? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "updateUserContent": updateUserContent.flatMap { $0.snapshot }])
    }

    public var updateUserContent: UpdateUserContent? {
      get {
        return (snapshot["updateUserContent"] as? Snapshot).flatMap { UpdateUserContent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "updateUserContent")
      }
    }

    public struct UpdateUserContent: GraphQLSelectionSet {
      public static let possibleTypes = ["UserContent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Title", type: .scalar(String.self)),
        GraphQLField("Level", type: .scalar(Int.self)),
        GraphQLField("Length", type: .scalar(Double.self)),
        GraphQLField("IsDemo", type: .scalar(Bool.self)),
        GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
        GraphQLField("ViewCount", type: .scalar(Int.self)),
        GraphQLField("Thumbnail", type: .scalar(String.self)),
        GraphQLField("Preview", type: .scalar(String.self)),
        GraphQLField("Segments", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Creator", type: .object(Creator.selections)),
        GraphQLField("FavoriteUser", type: .object(FavoriteUser.selections)),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, creator: Creator? = nil, favoriteUser: FavoriteUser? = nil, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "Creator": creator.flatMap { $0.snapshot }, "FavoriteUser": favoriteUser.flatMap { $0.snapshot }, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The ID of the user who created and own this content
      public var creatorId: GraphQLID {
        get {
          return snapshot["CreatorID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "CreatorID")
        }
      }

      public var contentName: String {
        get {
          return snapshot["ContentName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ContentName")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var title: String? {
        get {
          return snapshot["Title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Title")
        }
      }

      /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
      public var level: Int? {
        get {
          return snapshot["Level"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "Level")
        }
      }

      public var length: Double? {
        get {
          return snapshot["Length"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Length")
        }
      }

      public var isDemo: Bool? {
        get {
          return snapshot["IsDemo"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "IsDemo")
        }
      }

      public var transcodeReady: Bool? {
        get {
          return snapshot["TranscodeReady"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "TranscodeReady")
        }
      }

      public var viewCount: Int? {
        get {
          return snapshot["ViewCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ViewCount")
        }
      }

      public var thumbnail: String? {
        get {
          return snapshot["Thumbnail"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Thumbnail")
        }
      }

      public var preview: String? {
        get {
          return snapshot["Preview"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Preview")
        }
      }

      public var segments: String? {
        get {
          return snapshot["Segments"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Segments")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["Creator"] as? Snapshot).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Creator")
        }
      }

      public var favoriteUser: FavoriteUser? {
        get {
          return (snapshot["FavoriteUser"] as? Snapshot).flatMap { FavoriteUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "FavoriteUser")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct FavoriteUser: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}

public final class DeleteUserContentMutation: GraphQLMutation {
  public static let operationString =
    "mutation DeleteUserContent($input: DeleteUserContentInput!, $condition: ModelUserContentConditionInput) {\n  deleteUserContent(input: $input, condition: $condition) {\n    __typename\n    id\n    CreatorID\n    ContentName\n    Description\n    Title\n    Level\n    Length\n    IsDemo\n    TranscodeReady\n    ViewCount\n    Thumbnail\n    Preview\n    Segments\n    createdAt\n    updatedAt\n    Creator {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    FavoriteUser {\n      __typename\n      nextToken\n    }\n    owner\n  }\n}"

  public var input: DeleteUserContentInput
  public var condition: ModelUserContentConditionInput?

  public init(input: DeleteUserContentInput, condition: ModelUserContentConditionInput? = nil) {
    self.input = input
    self.condition = condition
  }

  public var variables: GraphQLMap? {
    return ["input": input, "condition": condition]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("deleteUserContent", arguments: ["input": GraphQLVariable("input"), "condition": GraphQLVariable("condition")], type: .object(DeleteUserContent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(deleteUserContent: DeleteUserContent? = nil) {
      self.init(snapshot: ["__typename": "Mutation", "deleteUserContent": deleteUserContent.flatMap { $0.snapshot }])
    }

    public var deleteUserContent: DeleteUserContent? {
      get {
        return (snapshot["deleteUserContent"] as? Snapshot).flatMap { DeleteUserContent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "deleteUserContent")
      }
    }

    public struct DeleteUserContent: GraphQLSelectionSet {
      public static let possibleTypes = ["UserContent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Title", type: .scalar(String.self)),
        GraphQLField("Level", type: .scalar(Int.self)),
        GraphQLField("Length", type: .scalar(Double.self)),
        GraphQLField("IsDemo", type: .scalar(Bool.self)),
        GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
        GraphQLField("ViewCount", type: .scalar(Int.self)),
        GraphQLField("Thumbnail", type: .scalar(String.self)),
        GraphQLField("Preview", type: .scalar(String.self)),
        GraphQLField("Segments", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Creator", type: .object(Creator.selections)),
        GraphQLField("FavoriteUser", type: .object(FavoriteUser.selections)),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, creator: Creator? = nil, favoriteUser: FavoriteUser? = nil, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "Creator": creator.flatMap { $0.snapshot }, "FavoriteUser": favoriteUser.flatMap { $0.snapshot }, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The ID of the user who created and own this content
      public var creatorId: GraphQLID {
        get {
          return snapshot["CreatorID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "CreatorID")
        }
      }

      public var contentName: String {
        get {
          return snapshot["ContentName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ContentName")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var title: String? {
        get {
          return snapshot["Title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Title")
        }
      }

      /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
      public var level: Int? {
        get {
          return snapshot["Level"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "Level")
        }
      }

      public var length: Double? {
        get {
          return snapshot["Length"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Length")
        }
      }

      public var isDemo: Bool? {
        get {
          return snapshot["IsDemo"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "IsDemo")
        }
      }

      public var transcodeReady: Bool? {
        get {
          return snapshot["TranscodeReady"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "TranscodeReady")
        }
      }

      public var viewCount: Int? {
        get {
          return snapshot["ViewCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ViewCount")
        }
      }

      public var thumbnail: String? {
        get {
          return snapshot["Thumbnail"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Thumbnail")
        }
      }

      public var preview: String? {
        get {
          return snapshot["Preview"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Preview")
        }
      }

      public var segments: String? {
        get {
          return snapshot["Segments"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Segments")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["Creator"] as? Snapshot).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Creator")
        }
      }

      public var favoriteUser: FavoriteUser? {
        get {
          return (snapshot["FavoriteUser"] as? Snapshot).flatMap { FavoriteUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "FavoriteUser")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct FavoriteUser: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}

public final class GetUserProfileQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserProfile($id: ID!) {\n  getUserProfile(id: $id) {\n    __typename\n    id\n    Birthday\n    Email\n    Gender\n    Height\n    RegDate\n    StripeID\n    UserImage\n    BgImage\n    BgTitle\n    LastName\n    FirstName\n    UserRole\n    Weight\n    Description\n    Biography\n    createdAt\n    updatedAt\n    owner\n    Subscriptions {\n      __typename\n      nextToken\n    }\n    Users {\n      __typename\n      nextToken\n    }\n    Favorites {\n      __typename\n      nextToken\n    }\n    Contents {\n      __typename\n      nextToken\n    }\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserProfile", arguments: ["id": GraphQLVariable("id")], type: .object(GetUserProfile.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserProfile: GetUserProfile? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserProfile": getUserProfile.flatMap { $0.snapshot }])
    }

    public var getUserProfile: GetUserProfile? {
      get {
        return (snapshot["getUserProfile"] as? Snapshot).flatMap { GetUserProfile(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUserProfile")
      }
    }

    public struct GetUserProfile: GraphQLSelectionSet {
      public static let possibleTypes = ["UserProfile"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("Birthday", type: .scalar(String.self)),
        GraphQLField("Email", type: .scalar(String.self)),
        GraphQLField("Gender", type: .scalar(String.self)),
        GraphQLField("Height", type: .scalar(Double.self)),
        GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("StripeID", type: .scalar(String.self)),
        GraphQLField("UserImage", type: .scalar(String.self)),
        GraphQLField("BgImage", type: .scalar(String.self)),
        GraphQLField("BgTitle", type: .scalar(String.self)),
        GraphQLField("LastName", type: .scalar(String.self)),
        GraphQLField("FirstName", type: .scalar(String.self)),
        GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
        GraphQLField("Weight", type: .scalar(Double.self)),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Biography", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("owner", type: .scalar(String.self)),
        GraphQLField("Subscriptions", type: .object(Subscription.selections)),
        GraphQLField("Users", type: .object(User.selections)),
        GraphQLField("Favorites", type: .object(Favorite.selections)),
        GraphQLField("Contents", type: .object(Content.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil, subscriptions: Subscription? = nil, users: User? = nil, favorites: Favorite? = nil, contents: Content? = nil) {
        self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner, "Subscriptions": subscriptions.flatMap { $0.snapshot }, "Users": users.flatMap { $0.snapshot }, "Favorites": favorites.flatMap { $0.snapshot }, "Contents": contents.flatMap { $0.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var birthday: String? {
        get {
          return snapshot["Birthday"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Birthday")
        }
      }

      public var email: String? {
        get {
          return snapshot["Email"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Email")
        }
      }

      public var gender: String? {
        get {
          return snapshot["Gender"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Gender")
        }
      }

      public var height: Double? {
        get {
          return snapshot["Height"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Height")
        }
      }

      public var regDate: String {
        get {
          return snapshot["RegDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "RegDate")
        }
      }

      public var stripeId: String? {
        get {
          return snapshot["StripeID"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "StripeID")
        }
      }

      public var userImage: String? {
        get {
          return snapshot["UserImage"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "UserImage")
        }
      }

      public var bgImage: String? {
        get {
          return snapshot["BgImage"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "BgImage")
        }
      }

      public var bgTitle: String? {
        get {
          return snapshot["BgTitle"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "BgTitle")
        }
      }

      public var lastName: String? {
        get {
          return snapshot["LastName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "LastName")
        }
      }

      public var firstName: String? {
        get {
          return snapshot["FirstName"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "FirstName")
        }
      }

      public var userRole: String {
        get {
          return snapshot["UserRole"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "UserRole")
        }
      }

      public var weight: Double? {
        get {
          return snapshot["Weight"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Weight")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var biography: String? {
        get {
          return snapshot["Biography"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Biography")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public var subscriptions: Subscription? {
        get {
          return (snapshot["Subscriptions"] as? Snapshot).flatMap { Subscription(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Subscriptions")
        }
      }

      public var users: User? {
        get {
          return (snapshot["Users"] as? Snapshot).flatMap { User(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Users")
        }
      }

      public var favorites: Favorite? {
        get {
          return (snapshot["Favorites"] as? Snapshot).flatMap { Favorite(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Favorites")
        }
      }

      public var contents: Content? {
        get {
          return (snapshot["Contents"] as? Snapshot).flatMap { Content(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Contents")
        }
      }

      public struct Subscription: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct Favorite: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }

      public struct Content: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}

public final class ListUserProfilesQuery: GraphQLQuery {
  public static let operationString =
    "query ListUserProfiles($filter: ModelUserProfileFilterInput, $limit: Int, $nextToken: String) {\n  listUserProfiles(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    nextToken\n  }\n}"

  public var filter: ModelUserProfileFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelUserProfileFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUserProfiles", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListUserProfile.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUserProfiles: ListUserProfile? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUserProfiles": listUserProfiles.flatMap { $0.snapshot }])
    }

    public var listUserProfiles: ListUserProfile? {
      get {
        return (snapshot["listUserProfiles"] as? Snapshot).flatMap { ListUserProfile(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listUserProfiles")
      }
    }

    public struct ListUserProfile: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserProfileConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelUserProfileConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class ProfilesByStripeIdQuery: GraphQLQuery {
  public static let operationString =
    "query ProfilesByStripeID($StripeID: String, $sortDirection: ModelSortDirection, $filter: ModelUserProfileFilterInput, $limit: Int, $nextToken: String) {\n  profilesByStripeID(StripeID: $StripeID, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    nextToken\n  }\n}"

  public var StripeID: String?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelUserProfileFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(StripeID: String? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelUserProfileFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.StripeID = StripeID
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["StripeID": StripeID, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("profilesByStripeID", arguments: ["StripeID": GraphQLVariable("StripeID"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ProfilesByStripeId.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(profilesByStripeId: ProfilesByStripeId? = nil) {
      self.init(snapshot: ["__typename": "Query", "profilesByStripeID": profilesByStripeId.flatMap { $0.snapshot }])
    }

    public var profilesByStripeId: ProfilesByStripeId? {
      get {
        return (snapshot["profilesByStripeID"] as? Snapshot).flatMap { ProfilesByStripeId(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "profilesByStripeID")
      }
    }

    public struct ProfilesByStripeId: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserProfileConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelUserProfileConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class SearchUserProfilesQuery: GraphQLQuery {
  public static let operationString =
    "query SearchUserProfiles($filter: SearchableUserProfileFilterInput, $sort: SearchableUserProfileSortInput, $limit: Int, $nextToken: String, $from: Int) {\n  searchUserProfiles(filter: $filter, sort: $sort, limit: $limit, nextToken: $nextToken, from: $from) {\n    __typename\n    items {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    nextToken\n    total\n  }\n}"

  public var filter: SearchableUserProfileFilterInput?
  public var sort: SearchableUserProfileSortInput?
  public var limit: Int?
  public var nextToken: String?
  public var from: Int?

  public init(filter: SearchableUserProfileFilterInput? = nil, sort: SearchableUserProfileSortInput? = nil, limit: Int? = nil, nextToken: String? = nil, from: Int? = nil) {
    self.filter = filter
    self.sort = sort
    self.limit = limit
    self.nextToken = nextToken
    self.from = from
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "sort": sort, "limit": limit, "nextToken": nextToken, "from": from]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("searchUserProfiles", arguments: ["filter": GraphQLVariable("filter"), "sort": GraphQLVariable("sort"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken"), "from": GraphQLVariable("from")], type: .object(SearchUserProfile.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(searchUserProfiles: SearchUserProfile? = nil) {
      self.init(snapshot: ["__typename": "Query", "searchUserProfiles": searchUserProfiles.flatMap { $0.snapshot }])
    }

    public var searchUserProfiles: SearchUserProfile? {
      get {
        return (snapshot["searchUserProfiles"] as? Snapshot).flatMap { SearchUserProfile(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "searchUserProfiles")
      }
    }

    public struct SearchUserProfile: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchableUserProfileConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
        GraphQLField("total", type: .scalar(Int.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil, total: Int? = nil) {
        self.init(snapshot: ["__typename": "SearchableUserProfileConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken, "total": total])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public var total: Int? {
        get {
          return snapshot["total"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "total")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class GetUserSubscriptionTrainerQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserSubscriptionTrainer($id: ID!) {\n  getUserSubscriptionTrainer(id: $id) {\n    __typename\n    id\n    StripeID\n    ExpireDate\n    CancelAtPeriodEnd\n    createdAt\n    updatedAt\n    Trainer {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    User {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    owner\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserSubscriptionTrainer", arguments: ["id": GraphQLVariable("id")], type: .object(GetUserSubscriptionTrainer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserSubscriptionTrainer: GetUserSubscriptionTrainer? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserSubscriptionTrainer": getUserSubscriptionTrainer.flatMap { $0.snapshot }])
    }

    public var getUserSubscriptionTrainer: GetUserSubscriptionTrainer? {
      get {
        return (snapshot["getUserSubscriptionTrainer"] as? Snapshot).flatMap { GetUserSubscriptionTrainer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUserSubscriptionTrainer")
      }
    }

    public struct GetUserSubscriptionTrainer: GraphQLSelectionSet {
      public static let possibleTypes = ["UserSubscriptionTrainer"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("StripeID", type: .nonNull(.scalar(String.self))),
        GraphQLField("ExpireDate", type: .nonNull(.scalar(String.self))),
        GraphQLField("CancelAtPeriodEnd", type: .nonNull(.scalar(Bool.self))),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Trainer", type: .nonNull(.object(Trainer.selections))),
        GraphQLField("User", type: .nonNull(.object(User.selections))),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, stripeId: String, expireDate: String, cancelAtPeriodEnd: Bool, createdAt: String, updatedAt: String, trainer: Trainer, user: User, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserSubscriptionTrainer", "id": id, "StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "createdAt": createdAt, "updatedAt": updatedAt, "Trainer": trainer.snapshot, "User": user.snapshot, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      public var stripeId: String {
        get {
          return snapshot["StripeID"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "StripeID")
        }
      }

      public var expireDate: String {
        get {
          return snapshot["ExpireDate"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ExpireDate")
        }
      }

      public var cancelAtPeriodEnd: Bool {
        get {
          return snapshot["CancelAtPeriodEnd"]! as! Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "CancelAtPeriodEnd")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var trainer: Trainer {
        get {
          return Trainer(snapshot: snapshot["Trainer"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "Trainer")
        }
      }

      public var user: User {
        get {
          return User(snapshot: snapshot["User"]! as! Snapshot)
        }
        set {
          snapshot.updateValue(newValue.snapshot, forKey: "User")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Trainer: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class ListUserSubscriptionTrainersQuery: GraphQLQuery {
  public static let operationString =
    "query ListUserSubscriptionTrainers($filter: ModelUserSubscriptionTrainerFilterInput, $limit: Int, $nextToken: String) {\n  listUserSubscriptionTrainers(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      StripeID\n      ExpireDate\n      CancelAtPeriodEnd\n      createdAt\n      updatedAt\n      owner\n    }\n    nextToken\n  }\n}"

  public var filter: ModelUserSubscriptionTrainerFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelUserSubscriptionTrainerFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUserSubscriptionTrainers", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListUserSubscriptionTrainer.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUserSubscriptionTrainers: ListUserSubscriptionTrainer? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUserSubscriptionTrainers": listUserSubscriptionTrainers.flatMap { $0.snapshot }])
    }

    public var listUserSubscriptionTrainers: ListUserSubscriptionTrainer? {
      get {
        return (snapshot["listUserSubscriptionTrainers"] as? Snapshot).flatMap { ListUserSubscriptionTrainer(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listUserSubscriptionTrainers")
      }
    }

    public struct ListUserSubscriptionTrainer: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserSubscriptionTrainerConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelUserSubscriptionTrainerConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["UserSubscriptionTrainer"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("StripeID", type: .nonNull(.scalar(String.self))),
          GraphQLField("ExpireDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("CancelAtPeriodEnd", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, stripeId: String, expireDate: String, cancelAtPeriodEnd: Bool, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserSubscriptionTrainer", "id": id, "StripeID": stripeId, "ExpireDate": expireDate, "CancelAtPeriodEnd": cancelAtPeriodEnd, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var stripeId: String {
          get {
            return snapshot["StripeID"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var expireDate: String {
          get {
            return snapshot["ExpireDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ExpireDate")
          }
        }

        public var cancelAtPeriodEnd: Bool {
          get {
            return snapshot["CancelAtPeriodEnd"]! as! Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "CancelAtPeriodEnd")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class GetUserContentQuery: GraphQLQuery {
  public static let operationString =
    "query GetUserContent($id: ID!) {\n  getUserContent(id: $id) {\n    __typename\n    id\n    CreatorID\n    ContentName\n    Description\n    Title\n    Level\n    Length\n    IsDemo\n    TranscodeReady\n    ViewCount\n    Thumbnail\n    Preview\n    Segments\n    createdAt\n    updatedAt\n    Creator {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    FavoriteUser {\n      __typename\n      nextToken\n    }\n    owner\n  }\n}"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getUserContent", arguments: ["id": GraphQLVariable("id")], type: .object(GetUserContent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getUserContent: GetUserContent? = nil) {
      self.init(snapshot: ["__typename": "Query", "getUserContent": getUserContent.flatMap { $0.snapshot }])
    }

    public var getUserContent: GetUserContent? {
      get {
        return (snapshot["getUserContent"] as? Snapshot).flatMap { GetUserContent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getUserContent")
      }
    }

    public struct GetUserContent: GraphQLSelectionSet {
      public static let possibleTypes = ["UserContent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Title", type: .scalar(String.self)),
        GraphQLField("Level", type: .scalar(Int.self)),
        GraphQLField("Length", type: .scalar(Double.self)),
        GraphQLField("IsDemo", type: .scalar(Bool.self)),
        GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
        GraphQLField("ViewCount", type: .scalar(Int.self)),
        GraphQLField("Thumbnail", type: .scalar(String.self)),
        GraphQLField("Preview", type: .scalar(String.self)),
        GraphQLField("Segments", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Creator", type: .object(Creator.selections)),
        GraphQLField("FavoriteUser", type: .object(FavoriteUser.selections)),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, creator: Creator? = nil, favoriteUser: FavoriteUser? = nil, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "Creator": creator.flatMap { $0.snapshot }, "FavoriteUser": favoriteUser.flatMap { $0.snapshot }, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The ID of the user who created and own this content
      public var creatorId: GraphQLID {
        get {
          return snapshot["CreatorID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "CreatorID")
        }
      }

      public var contentName: String {
        get {
          return snapshot["ContentName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ContentName")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var title: String? {
        get {
          return snapshot["Title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Title")
        }
      }

      /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
      public var level: Int? {
        get {
          return snapshot["Level"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "Level")
        }
      }

      public var length: Double? {
        get {
          return snapshot["Length"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Length")
        }
      }

      public var isDemo: Bool? {
        get {
          return snapshot["IsDemo"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "IsDemo")
        }
      }

      public var transcodeReady: Bool? {
        get {
          return snapshot["TranscodeReady"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "TranscodeReady")
        }
      }

      public var viewCount: Int? {
        get {
          return snapshot["ViewCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ViewCount")
        }
      }

      public var thumbnail: String? {
        get {
          return snapshot["Thumbnail"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Thumbnail")
        }
      }

      public var preview: String? {
        get {
          return snapshot["Preview"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Preview")
        }
      }

      public var segments: String? {
        get {
          return snapshot["Segments"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Segments")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["Creator"] as? Snapshot).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Creator")
        }
      }

      public var favoriteUser: FavoriteUser? {
        get {
          return (snapshot["FavoriteUser"] as? Snapshot).flatMap { FavoriteUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "FavoriteUser")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct FavoriteUser: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}

public final class ListUserContentsQuery: GraphQLQuery {
  public static let operationString =
    "query ListUserContents($filter: ModelUserContentFilterInput, $limit: Int, $nextToken: String) {\n  listUserContents(filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      CreatorID\n      ContentName\n      Description\n      Title\n      Level\n      Length\n      IsDemo\n      TranscodeReady\n      ViewCount\n      Thumbnail\n      Preview\n      Segments\n      createdAt\n      updatedAt\n      owner\n    }\n    nextToken\n  }\n}"

  public var filter: ModelUserContentFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(filter: ModelUserContentFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("listUserContents", arguments: ["filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ListUserContent.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(listUserContents: ListUserContent? = nil) {
      self.init(snapshot: ["__typename": "Query", "listUserContents": listUserContents.flatMap { $0.snapshot }])
    }

    public var listUserContents: ListUserContent? {
      get {
        return (snapshot["listUserContents"] as? Snapshot).flatMap { ListUserContent(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "listUserContents")
      }
    }

    public struct ListUserContent: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserContentConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelUserContentConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["UserContent"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Title", type: .scalar(String.self)),
          GraphQLField("Level", type: .scalar(Int.self)),
          GraphQLField("Length", type: .scalar(Double.self)),
          GraphQLField("IsDemo", type: .scalar(Bool.self)),
          GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
          GraphQLField("ViewCount", type: .scalar(Int.self)),
          GraphQLField("Thumbnail", type: .scalar(String.self)),
          GraphQLField("Preview", type: .scalar(String.self)),
          GraphQLField("Segments", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The ID of the user who created and own this content
        public var creatorId: GraphQLID {
          get {
            return snapshot["CreatorID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "CreatorID")
          }
        }

        public var contentName: String {
          get {
            return snapshot["ContentName"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ContentName")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var title: String? {
          get {
            return snapshot["Title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Title")
          }
        }

        /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
        public var level: Int? {
          get {
            return snapshot["Level"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "Level")
          }
        }

        public var length: Double? {
          get {
            return snapshot["Length"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Length")
          }
        }

        public var isDemo: Bool? {
          get {
            return snapshot["IsDemo"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "IsDemo")
          }
        }

        public var transcodeReady: Bool? {
          get {
            return snapshot["TranscodeReady"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "TranscodeReady")
          }
        }

        public var viewCount: Int? {
          get {
            return snapshot["ViewCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ViewCount")
          }
        }

        public var thumbnail: String? {
          get {
            return snapshot["Thumbnail"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Thumbnail")
          }
        }

        public var preview: String? {
          get {
            return snapshot["Preview"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Preview")
          }
        }

        public var segments: String? {
          get {
            return snapshot["Segments"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Segments")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class ContentByNameQuery: GraphQLQuery {
  public static let operationString =
    "query ContentByName($ContentName: String, $sortDirection: ModelSortDirection, $filter: ModelUserContentFilterInput, $limit: Int, $nextToken: String) {\n  contentByName(ContentName: $ContentName, sortDirection: $sortDirection, filter: $filter, limit: $limit, nextToken: $nextToken) {\n    __typename\n    items {\n      __typename\n      id\n      CreatorID\n      ContentName\n      Description\n      Title\n      Level\n      Length\n      IsDemo\n      TranscodeReady\n      ViewCount\n      Thumbnail\n      Preview\n      Segments\n      createdAt\n      updatedAt\n      owner\n    }\n    nextToken\n  }\n}"

  public var ContentName: String?
  public var sortDirection: ModelSortDirection?
  public var filter: ModelUserContentFilterInput?
  public var limit: Int?
  public var nextToken: String?

  public init(ContentName: String? = nil, sortDirection: ModelSortDirection? = nil, filter: ModelUserContentFilterInput? = nil, limit: Int? = nil, nextToken: String? = nil) {
    self.ContentName = ContentName
    self.sortDirection = sortDirection
    self.filter = filter
    self.limit = limit
    self.nextToken = nextToken
  }

  public var variables: GraphQLMap? {
    return ["ContentName": ContentName, "sortDirection": sortDirection, "filter": filter, "limit": limit, "nextToken": nextToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("contentByName", arguments: ["ContentName": GraphQLVariable("ContentName"), "sortDirection": GraphQLVariable("sortDirection"), "filter": GraphQLVariable("filter"), "limit": GraphQLVariable("limit"), "nextToken": GraphQLVariable("nextToken")], type: .object(ContentByName.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(contentByName: ContentByName? = nil) {
      self.init(snapshot: ["__typename": "Query", "contentByName": contentByName.flatMap { $0.snapshot }])
    }

    public var contentByName: ContentByName? {
      get {
        return (snapshot["contentByName"] as? Snapshot).flatMap { ContentByName(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "contentByName")
      }
    }

    public struct ContentByName: GraphQLSelectionSet {
      public static let possibleTypes = ["ModelUserContentConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("items", type: .list(.object(Item.selections))),
        GraphQLField("nextToken", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(items: [Item?]? = nil, nextToken: String? = nil) {
        self.init(snapshot: ["__typename": "ModelUserContentConnection", "items": items.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, "nextToken": nextToken])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item?]? {
        get {
          return (snapshot["items"] as? [Snapshot?]).flatMap { $0.map { $0.flatMap { Item(snapshot: $0) } } }
        }
        set {
          snapshot.updateValue(newValue.flatMap { $0.map { $0.flatMap { $0.snapshot } } }, forKey: "items")
        }
      }

      public var nextToken: String? {
        get {
          return snapshot["nextToken"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "nextToken")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes = ["UserContent"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Title", type: .scalar(String.self)),
          GraphQLField("Level", type: .scalar(Int.self)),
          GraphQLField("Length", type: .scalar(Double.self)),
          GraphQLField("IsDemo", type: .scalar(Bool.self)),
          GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
          GraphQLField("ViewCount", type: .scalar(Int.self)),
          GraphQLField("Thumbnail", type: .scalar(String.self)),
          GraphQLField("Preview", type: .scalar(String.self)),
          GraphQLField("Segments", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        /// The ID of the user who created and own this content
        public var creatorId: GraphQLID {
          get {
            return snapshot["CreatorID"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "CreatorID")
          }
        }

        public var contentName: String {
          get {
            return snapshot["ContentName"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "ContentName")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var title: String? {
          get {
            return snapshot["Title"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Title")
          }
        }

        /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
        public var level: Int? {
          get {
            return snapshot["Level"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "Level")
          }
        }

        public var length: Double? {
          get {
            return snapshot["Length"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Length")
          }
        }

        public var isDemo: Bool? {
          get {
            return snapshot["IsDemo"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "IsDemo")
          }
        }

        public var transcodeReady: Bool? {
          get {
            return snapshot["TranscodeReady"] as? Bool
          }
          set {
            snapshot.updateValue(newValue, forKey: "TranscodeReady")
          }
        }

        public var viewCount: Int? {
          get {
            return snapshot["ViewCount"] as? Int
          }
          set {
            snapshot.updateValue(newValue, forKey: "ViewCount")
          }
        }

        public var thumbnail: String? {
          get {
            return snapshot["Thumbnail"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Thumbnail")
          }
        }

        public var preview: String? {
          get {
            return snapshot["Preview"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Preview")
          }
        }

        public var segments: String? {
          get {
            return snapshot["Segments"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Segments")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }
    }
  }
}

public final class OnContentByCreatorIdSubscription: GraphQLSubscription {
  public static let operationString =
    "subscription OnContentByCreatorID($CreatorID: ID!) {\n  onContentByCreatorID(CreatorID: $CreatorID) {\n    __typename\n    id\n    CreatorID\n    ContentName\n    Description\n    Title\n    Level\n    Length\n    IsDemo\n    TranscodeReady\n    ViewCount\n    Thumbnail\n    Preview\n    Segments\n    createdAt\n    updatedAt\n    Creator {\n      __typename\n      id\n      Birthday\n      Email\n      Gender\n      Height\n      RegDate\n      StripeID\n      UserImage\n      BgImage\n      BgTitle\n      LastName\n      FirstName\n      UserRole\n      Weight\n      Description\n      Biography\n      createdAt\n      updatedAt\n      owner\n    }\n    FavoriteUser {\n      __typename\n      nextToken\n    }\n    owner\n  }\n}"

  public var CreatorID: GraphQLID

  public init(CreatorID: GraphQLID) {
    self.CreatorID = CreatorID
  }

  public var variables: GraphQLMap? {
    return ["CreatorID": CreatorID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Subscription"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("onContentByCreatorID", arguments: ["CreatorID": GraphQLVariable("CreatorID")], type: .object(OnContentByCreatorId.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(onContentByCreatorId: OnContentByCreatorId? = nil) {
      self.init(snapshot: ["__typename": "Subscription", "onContentByCreatorID": onContentByCreatorId.flatMap { $0.snapshot }])
    }

    public var onContentByCreatorId: OnContentByCreatorId? {
      get {
        return (snapshot["onContentByCreatorID"] as? Snapshot).flatMap { OnContentByCreatorId(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "onContentByCreatorID")
      }
    }

    public struct OnContentByCreatorId: GraphQLSelectionSet {
      public static let possibleTypes = ["UserContent"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("CreatorID", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("ContentName", type: .nonNull(.scalar(String.self))),
        GraphQLField("Description", type: .scalar(String.self)),
        GraphQLField("Title", type: .scalar(String.self)),
        GraphQLField("Level", type: .scalar(Int.self)),
        GraphQLField("Length", type: .scalar(Double.self)),
        GraphQLField("IsDemo", type: .scalar(Bool.self)),
        GraphQLField("TranscodeReady", type: .scalar(Bool.self)),
        GraphQLField("ViewCount", type: .scalar(Int.self)),
        GraphQLField("Thumbnail", type: .scalar(String.self)),
        GraphQLField("Preview", type: .scalar(String.self)),
        GraphQLField("Segments", type: .scalar(String.self)),
        GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
        GraphQLField("Creator", type: .object(Creator.selections)),
        GraphQLField("FavoriteUser", type: .object(FavoriteUser.selections)),
        GraphQLField("owner", type: .scalar(String.self)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(id: GraphQLID, creatorId: GraphQLID, contentName: String, description: String? = nil, title: String? = nil, level: Int? = nil, length: Double? = nil, isDemo: Bool? = nil, transcodeReady: Bool? = nil, viewCount: Int? = nil, thumbnail: String? = nil, preview: String? = nil, segments: String? = nil, createdAt: String, updatedAt: String, creator: Creator? = nil, favoriteUser: FavoriteUser? = nil, owner: String? = nil) {
        self.init(snapshot: ["__typename": "UserContent", "id": id, "CreatorID": creatorId, "ContentName": contentName, "Description": description, "Title": title, "Level": level, "Length": length, "IsDemo": isDemo, "TranscodeReady": transcodeReady, "ViewCount": viewCount, "Thumbnail": thumbnail, "Preview": preview, "Segments": segments, "createdAt": createdAt, "updatedAt": updatedAt, "Creator": creator.flatMap { $0.snapshot }, "FavoriteUser": favoriteUser.flatMap { $0.snapshot }, "owner": owner])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return snapshot["id"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "id")
        }
      }

      /// The ID of the user who created and own this content
      public var creatorId: GraphQLID {
        get {
          return snapshot["CreatorID"]! as! GraphQLID
        }
        set {
          snapshot.updateValue(newValue, forKey: "CreatorID")
        }
      }

      public var contentName: String {
        get {
          return snapshot["ContentName"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "ContentName")
        }
      }

      public var description: String? {
        get {
          return snapshot["Description"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Description")
        }
      }

      public var title: String? {
        get {
          return snapshot["Title"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Title")
        }
      }

      /// The level indicates the difficulty of the training course, e.g. 1 => easy, 2=> medium, 3=>hard
      public var level: Int? {
        get {
          return snapshot["Level"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "Level")
        }
      }

      public var length: Double? {
        get {
          return snapshot["Length"] as? Double
        }
        set {
          snapshot.updateValue(newValue, forKey: "Length")
        }
      }

      public var isDemo: Bool? {
        get {
          return snapshot["IsDemo"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "IsDemo")
        }
      }

      public var transcodeReady: Bool? {
        get {
          return snapshot["TranscodeReady"] as? Bool
        }
        set {
          snapshot.updateValue(newValue, forKey: "TranscodeReady")
        }
      }

      public var viewCount: Int? {
        get {
          return snapshot["ViewCount"] as? Int
        }
        set {
          snapshot.updateValue(newValue, forKey: "ViewCount")
        }
      }

      public var thumbnail: String? {
        get {
          return snapshot["Thumbnail"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Thumbnail")
        }
      }

      public var preview: String? {
        get {
          return snapshot["Preview"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Preview")
        }
      }

      public var segments: String? {
        get {
          return snapshot["Segments"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "Segments")
        }
      }

      public var createdAt: String {
        get {
          return snapshot["createdAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var updatedAt: String {
        get {
          return snapshot["updatedAt"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "updatedAt")
        }
      }

      public var creator: Creator? {
        get {
          return (snapshot["Creator"] as? Snapshot).flatMap { Creator(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "Creator")
        }
      }

      public var favoriteUser: FavoriteUser? {
        get {
          return (snapshot["FavoriteUser"] as? Snapshot).flatMap { FavoriteUser(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "FavoriteUser")
        }
      }

      public var owner: String? {
        get {
          return snapshot["owner"] as? String
        }
        set {
          snapshot.updateValue(newValue, forKey: "owner")
        }
      }

      public struct Creator: GraphQLSelectionSet {
        public static let possibleTypes = ["UserProfile"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("Birthday", type: .scalar(String.self)),
          GraphQLField("Email", type: .scalar(String.self)),
          GraphQLField("Gender", type: .scalar(String.self)),
          GraphQLField("Height", type: .scalar(Double.self)),
          GraphQLField("RegDate", type: .nonNull(.scalar(String.self))),
          GraphQLField("StripeID", type: .scalar(String.self)),
          GraphQLField("UserImage", type: .scalar(String.self)),
          GraphQLField("BgImage", type: .scalar(String.self)),
          GraphQLField("BgTitle", type: .scalar(String.self)),
          GraphQLField("LastName", type: .scalar(String.self)),
          GraphQLField("FirstName", type: .scalar(String.self)),
          GraphQLField("UserRole", type: .nonNull(.scalar(String.self))),
          GraphQLField("Weight", type: .scalar(Double.self)),
          GraphQLField("Description", type: .scalar(String.self)),
          GraphQLField("Biography", type: .scalar(String.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("owner", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(id: GraphQLID, birthday: String? = nil, email: String? = nil, gender: String? = nil, height: Double? = nil, regDate: String, stripeId: String? = nil, userImage: String? = nil, bgImage: String? = nil, bgTitle: String? = nil, lastName: String? = nil, firstName: String? = nil, userRole: String, weight: Double? = nil, description: String? = nil, biography: String? = nil, createdAt: String, updatedAt: String, owner: String? = nil) {
          self.init(snapshot: ["__typename": "UserProfile", "id": id, "Birthday": birthday, "Email": email, "Gender": gender, "Height": height, "RegDate": regDate, "StripeID": stripeId, "UserImage": userImage, "BgImage": bgImage, "BgTitle": bgTitle, "LastName": lastName, "FirstName": firstName, "UserRole": userRole, "Weight": weight, "Description": description, "Biography": biography, "createdAt": createdAt, "updatedAt": updatedAt, "owner": owner])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return snapshot["id"]! as! GraphQLID
          }
          set {
            snapshot.updateValue(newValue, forKey: "id")
          }
        }

        public var birthday: String? {
          get {
            return snapshot["Birthday"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Birthday")
          }
        }

        public var email: String? {
          get {
            return snapshot["Email"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Email")
          }
        }

        public var gender: String? {
          get {
            return snapshot["Gender"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Gender")
          }
        }

        public var height: Double? {
          get {
            return snapshot["Height"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Height")
          }
        }

        public var regDate: String {
          get {
            return snapshot["RegDate"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "RegDate")
          }
        }

        public var stripeId: String? {
          get {
            return snapshot["StripeID"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "StripeID")
          }
        }

        public var userImage: String? {
          get {
            return snapshot["UserImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserImage")
          }
        }

        public var bgImage: String? {
          get {
            return snapshot["BgImage"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgImage")
          }
        }

        public var bgTitle: String? {
          get {
            return snapshot["BgTitle"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "BgTitle")
          }
        }

        public var lastName: String? {
          get {
            return snapshot["LastName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "LastName")
          }
        }

        public var firstName: String? {
          get {
            return snapshot["FirstName"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "FirstName")
          }
        }

        public var userRole: String {
          get {
            return snapshot["UserRole"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "UserRole")
          }
        }

        public var weight: Double? {
          get {
            return snapshot["Weight"] as? Double
          }
          set {
            snapshot.updateValue(newValue, forKey: "Weight")
          }
        }

        public var description: String? {
          get {
            return snapshot["Description"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Description")
          }
        }

        public var biography: String? {
          get {
            return snapshot["Biography"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "Biography")
          }
        }

        public var createdAt: String {
          get {
            return snapshot["createdAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "createdAt")
          }
        }

        public var updatedAt: String {
          get {
            return snapshot["updatedAt"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "updatedAt")
          }
        }

        public var owner: String? {
          get {
            return snapshot["owner"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "owner")
          }
        }
      }

      public struct FavoriteUser: GraphQLSelectionSet {
        public static let possibleTypes = ["ModelUserFavoriteContentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nextToken", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(nextToken: String? = nil) {
          self.init(snapshot: ["__typename": "ModelUserFavoriteContentConnection", "nextToken": nextToken])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var nextToken: String? {
          get {
            return snapshot["nextToken"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "nextToken")
          }
        }
      }
    }
  }
}