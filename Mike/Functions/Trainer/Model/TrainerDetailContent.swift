//
//	TrainerDetailContent.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class TrainerDetailContent : NSObject, NSCoding{

	var items : [UserCenterContent]!
	var contentName : String!
	var creatorID : String!
	var descriptionField : String!
	var isDemo : Bool!
	var length : Int!
	var level : Int!
	var preview : String?
	var segments : String!
	var thumbnail : String!
	var title : String!
	var viewCount : Int?
	var createdAt : String!
	var id : String!
	var owner : String!
	var updatedAt : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		items = [UserCenterContent]()
		if let itemsArray = dictionary["items"] as? [[String:Any]]{
			for dic in itemsArray{
				let value = UserCenterContent(fromDictionary: dic)
				items.append(value)
			}
		}
		contentName = dictionary["ContentName"] as? String
		creatorID = dictionary["CreatorID"] as? String
		descriptionField = dictionary["Description"] as? String
		isDemo = dictionary["IsDemo"] as? Bool
		length = dictionary["Length"] as? Int
		level = dictionary["Level"] as? Int
		preview = dictionary["Preview"] as? String
		segments = dictionary["Segments"] as? String
		thumbnail = dictionary["Thumbnail"] as? String
		title = dictionary["Title"] as? String
		viewCount = dictionary["ViewCount"] as? Int
		createdAt = dictionary["createdAt"] as? String
		id = dictionary["id"] as? String
		owner = dictionary["owner"] as? String
		updatedAt = dictionary["updatedAt"] as? String
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
		if contentName != nil{
			dictionary["ContentName"] = contentName
		}
		if creatorID != nil{
			dictionary["CreatorID"] = creatorID
		}
		if descriptionField != nil{
			dictionary["Description"] = descriptionField
		}
		if isDemo != nil{
			dictionary["IsDemo"] = isDemo
		}
		if length != nil{
			dictionary["Length"] = length
		}
		if level != nil{
			dictionary["Level"] = level
		}
		if preview != nil{
			dictionary["Preview"] = preview
		}
		if segments != nil{
			dictionary["Segments"] = segments
		}
		if thumbnail != nil{
			dictionary["Thumbnail"] = thumbnail
		}
		if title != nil{
			dictionary["Title"] = title
		}
		if viewCount != nil{
			dictionary["ViewCount"] = viewCount
		}
		if createdAt != nil{
			dictionary["createdAt"] = createdAt
		}
		if id != nil{
			dictionary["id"] = id
		}
		if owner != nil{
			dictionary["owner"] = owner
		}
		if updatedAt != nil{
			dictionary["updatedAt"] = updatedAt
		}
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         items = aDecoder.decodeObject(forKey :"items") as? [UserCenterContent]
         contentName = aDecoder.decodeObject(forKey: "ContentName") as? String
         creatorID = aDecoder.decodeObject(forKey: "CreatorID") as? String
         descriptionField = aDecoder.decodeObject(forKey: "Description") as? String
         isDemo = aDecoder.decodeObject(forKey: "IsDemo") as? Bool
         length = aDecoder.decodeObject(forKey: "Length") as? Int
         level = aDecoder.decodeObject(forKey: "Level") as? Int
         preview = aDecoder.decodeObject(forKey: "Preview") as? String
         segments = aDecoder.decodeObject(forKey: "Segments") as? String
         thumbnail = aDecoder.decodeObject(forKey: "Thumbnail") as? String
         title = aDecoder.decodeObject(forKey: "Title") as? String
         viewCount = aDecoder.decodeObject(forKey: "ViewCount") as? Int
         createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         owner = aDecoder.decodeObject(forKey: "owner") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as? String

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
		if contentName != nil{
			aCoder.encode(contentName, forKey: "ContentName")
		}
		if creatorID != nil{
			aCoder.encode(creatorID, forKey: "CreatorID")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "Description")
		}
		if isDemo != nil{
			aCoder.encode(isDemo, forKey: "IsDemo")
		}
		if length != nil{
			aCoder.encode(length, forKey: "Length")
		}
		if level != nil{
			aCoder.encode(level, forKey: "Level")
		}
		if preview != nil{
			aCoder.encode(preview, forKey: "Preview")
		}
		if segments != nil{
			aCoder.encode(segments, forKey: "Segments")
		}
		if thumbnail != nil{
			aCoder.encode(thumbnail, forKey: "Thumbnail")
		}
		if title != nil{
			aCoder.encode(title, forKey: "Title")
		}
		if viewCount != nil{
			aCoder.encode(viewCount, forKey: "ViewCount")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "createdAt")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}
		if owner != nil{
			aCoder.encode(owner, forKey: "owner")
		}
		if updatedAt != nil{
			aCoder.encode(updatedAt, forKey: "updatedAt")
		}

	}

}
