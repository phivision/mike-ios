//
//	UserSubscriptionTrainerListContent.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserSubscriptionTrainerListContent : NSObject, NSCoding{

	var items : [UserSubscriptionTrainerListItem]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		items = [UserSubscriptionTrainerListItem]()
		if let itemsArray = dictionary["items"] as? [[String:Any]]{
			for dic in itemsArray{
				let value = UserSubscriptionTrainerListItem(fromDictionary: dic)
				items.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if items != nil{
			var dictionaryElements = [[String:Any]]()
			for itemsElement in items {
				dictionaryElements.append(itemsElement.toDictionary())
			}
			dictionary["items"] = dictionaryElements
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         items = aDecoder.decodeObject(forKey :"items") as? [UserSubscriptionTrainerListItem]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if items != nil{
			aCoder.encode(items, forKey: "items")
		}

	}

}