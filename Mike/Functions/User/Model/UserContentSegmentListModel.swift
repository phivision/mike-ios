//
//	UserContentSegmentListModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserContentSegmentListModel : NSObject, NSCoding{

	var name : String!
	var rPE : String!
	var reps : String!
	var sets : String!
	var timestamp : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		name = dictionary["Name"] as? String ?? ""
		rPE = dictionary["RPE"] as? String ?? ""
		reps = dictionary["Reps"] as? String ?? ""
		sets = dictionary["Sets"] as? String ?? ""
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
		if rPE != nil{
			dictionary["RPE"] = rPE
		}
		if reps != nil{
			dictionary["Reps"] = reps
		}
		if sets != nil{
			dictionary["Sets"] = sets
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
         rPE = aDecoder.decodeObject(forKey: "RPE") as? String ?? ""
         reps = aDecoder.decodeObject(forKey: "Reps") as? String ?? ""
         sets = aDecoder.decodeObject(forKey: "Sets") as? String ?? ""
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
		if rPE != nil{
			aCoder.encode(rPE, forKey: "RPE")
		}
		if reps != nil{
			aCoder.encode(reps, forKey: "Reps")
		}
		if sets != nil{
			aCoder.encode(sets, forKey: "Sets")
		}
		if timestamp != nil{
			aCoder.encode(timestamp, forKey: "Timestamp")
		}

	}

}
