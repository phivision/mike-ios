//
//	UserCenterItem.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserCenterItem : NSObject, NSCoding{

	var content : UserCenterContent!
	var trainer : UserCenterTrainer!
	var id : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let contentData = dictionary["Content"] as? [String:Any]{
			content = UserCenterContent(fromDictionary: contentData)
		}
		if let trainerData = dictionary["Trainer"] as? [String:Any]{
			trainer = UserCenterTrainer(fromDictionary: trainerData)
		}
		id = dictionary["id"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if content != nil{
			dictionary["Content"] = content.toDictionary()
		}
		if trainer != nil{
			dictionary["Trainer"] = trainer.toDictionary()
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
         content = aDecoder.decodeObject(forKey: "Content") as? UserCenterContent
         trainer = aDecoder.decodeObject(forKey: "Trainer") as? UserCenterTrainer
         id = aDecoder.decodeObject(forKey: "id") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if content != nil{
			aCoder.encode(content, forKey: "Content")
		}
		if trainer != nil{
			aCoder.encode(trainer, forKey: "Trainer")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}

	}

}