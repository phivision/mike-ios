//
//	UserMatricsListModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserMatricsListModel : NSObject, NSCoding{

	var contentValue : String!
	var title : String!
	var type : HealthType!
	var unit : String!
	var updateTime : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		contentValue = dictionary["contentValue"] as? String
		title = dictionary["title"] as? String
		type = dictionary["type"] as? HealthType
		unit = dictionary["unit"] as? String
		updateTime = dictionary["updateTime"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if contentValue != nil{
			dictionary["contentValue"] = contentValue
		}
		if title != nil{
			dictionary["title"] = title
		}
		if type != nil{
			dictionary["type"] = type
		}
		if unit != nil{
			dictionary["unit"] = unit
		}
		if updateTime != nil{
			dictionary["updateTime"] = updateTime
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         contentValue = aDecoder.decodeObject(forKey: "contentValue") as? String
         title = aDecoder.decodeObject(forKey: "title") as? String
         type = aDecoder.decodeObject(forKey: "type") as? HealthType
         unit = aDecoder.decodeObject(forKey: "unit") as? String
         updateTime = aDecoder.decodeObject(forKey: "updateTime") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if contentValue != nil{
			aCoder.encode(contentValue, forKey: "contentValue")
		}
		if title != nil{
			aCoder.encode(title, forKey: "title")
		}
		if type != nil{
			aCoder.encode(type, forKey: "type")
		}
		if unit != nil{
			aCoder.encode(unit, forKey: "unit")
		}
		if updateTime != nil{
			aCoder.encode(updateTime, forKey: "updateTime")
		}

	}

}
