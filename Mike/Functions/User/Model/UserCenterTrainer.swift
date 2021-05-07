//
//	UserCenterTrainer.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserCenterTrainer : NSObject, NSCoding{

	var userImage : String!
	var id : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		userImage = dictionary["UserImage"] as? String
		id = dictionary["id"] as? String
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

	}

}
