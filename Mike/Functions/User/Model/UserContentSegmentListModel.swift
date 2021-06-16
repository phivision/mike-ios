//
//	UserContentSegmentListModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserContentSegmentListModel : NSObject, NSCoding{

	var name : String!
	var timestamp : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		name = dictionary["Name"] as? String ?? ""
		timestamp = dictionary["Timestamp"] as? String ?? ""
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if name != nil{
			dictionary["Name"] = name
		}
		if timestamp != nil{
			dictionary["Timestamp"] = timestamp
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         name = aDecoder.decodeObject(forKey: "Name") as? String ?? ""
         timestamp = aDecoder.decodeObject(forKey: "Timestamp") as? String ?? ""

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if name != nil{
			aCoder.encode(name, forKey: "Name")
		}
		if timestamp != nil{
			aCoder.encode(timestamp, forKey: "Timestamp")
		}

	}

}
