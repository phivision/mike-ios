//
//	UserCenterTrainer.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserCenterTrainer : NSObject, NSCoding,NSSecureCoding{
    static var supportsSecureCoding: Bool { return true }
	var userImage : String!
	var id : String!
    var firstName : String!
    var lastName : String!
    var updatedAt: String!
    var tokenPrice: Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		userImage = dictionary["UserImage"] as? String
		id = dictionary["id"] as? String
        firstName = dictionary["FirstName"] as? String
        lastName = dictionary["LastName"] as? String
        updatedAt = dictionary["updatedAt"] as? String
        tokenPrice = dictionary["TokenPrice"] as? Int ?? 0
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if userImage != nil{
			dictionary["UserImage"] = userImage
		}
		if id != nil{
			dictionary["id"] = id
		}
        if firstName != nil {
            dictionary["FirstName"] = firstName
        }
        if lastName != nil {
            dictionary["LastName"] = lastName
        }
        if updatedAt != nil {
            dictionary["updatedAt"] = updatedAt
        }
        if tokenPrice != nil {
            dictionary["TokenPrice"] = tokenPrice
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         userImage = aDecoder.decodeObject(forKey: "UserImage") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
        lastName = aDecoder.decodeObject(forKey: "LastName") as? String
        firstName = aDecoder.decodeObject(forKey: "FirstName") as? String
        updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as? String
        tokenPrice = aDecoder.decodeObject(forKey: "TokenPrice") as? Int ?? 0
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if userImage != nil{
			aCoder.encode(userImage, forKey: "UserImage")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
        if firstName != nil{
            aCoder.encode(firstName, forKey: "FirstName")
        }
        if lastName != nil{
            aCoder.encode(lastName, forKey: "LastName")
        }
        if updatedAt != nil {
            aCoder.encode(updatedAt, forKey: "updatedAt")
        }
        if tokenPrice != nil {
            aCoder.encode(tokenPrice,forKey: "TokenPrice")
        }
	}

}
