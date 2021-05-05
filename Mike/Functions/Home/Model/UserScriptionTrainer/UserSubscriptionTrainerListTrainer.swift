//
//	UserSubscriptionTrainerListTrainer.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserSubscriptionTrainerListTrainer : NSObject, NSCoding{

	var contents : UserSubscriptionTrainerListContent!
	var firstName : String!
	var lastName : String!
	var userImage : String!
	var userRole : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let contentsData = dictionary["Contents"] as? [String:Any]{
			contents = UserSubscriptionTrainerListContent(fromDictionary: contentsData)
		}
		firstName = dictionary["FirstName"] as? String
		lastName = dictionary["LastName"] as? String
		userImage = dictionary["UserImage"] as? String
		userRole = dictionary["UserRole"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if contents != nil{
			dictionary["Contents"] = contents.toDictionary()
		}
		if firstName != nil{
			dictionary["FirstName"] = firstName
		}
		if lastName != nil{
			dictionary["LastName"] = lastName
		}
		if userImage != nil{
			dictionary["UserImage"] = userImage
		}
		if userRole != nil{
			dictionary["UserRole"] = userRole
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         contents = aDecoder.decodeObject(forKey: "Contents") as? UserSubscriptionTrainerListContent
         firstName = aDecoder.decodeObject(forKey: "FirstName") as? String
         lastName = aDecoder.decodeObject(forKey: "LastName") as? String
         userImage = aDecoder.decodeObject(forKey: "UserImage") as? String
         userRole = aDecoder.decodeObject(forKey: "UserRole") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if contents != nil{
			aCoder.encode(contents, forKey: "Contents")
		}
		if firstName != nil{
			aCoder.encode(firstName, forKey: "FirstName")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "LastName")
		}
		if userImage != nil{
			aCoder.encode(userImage, forKey: "UserImage")
		}
		if userRole != nil{
			aCoder.encode(userRole, forKey: "UserRole")
		}

	}

}