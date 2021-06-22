//
//	MessageListFromUser.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MessageListFromUser : NSObject, NSCoding, NSSecureCoding{
    static var supportsSecureCoding: Bool { return true }
	var firstName : String!
	var lastName : String!
	var userImage : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		firstName = dictionary["FirstName"] as? String
		lastName = dictionary["LastName"] as? String
		userImage = dictionary["UserImage"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if firstName != nil{
			dictionary["FirstName"] = firstName
		}
		if lastName != nil{
			dictionary["LastName"] = lastName
		}
		if userImage != nil{
			dictionary["UserImage"] = userImage
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         firstName = aDecoder.decodeObject(forKey: "FirstName") as? String
         lastName = aDecoder.decodeObject(forKey: "LastName") as? String
         userImage = aDecoder.decodeObject(forKey: "UserImage") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if firstName != nil{
			aCoder.encode(firstName, forKey: "FirstName")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "LastName")
		}
		if userImage != nil{
			aCoder.encode(userImage, forKey: "UserImage")
		}

	}

}
