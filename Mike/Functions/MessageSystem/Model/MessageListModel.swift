//
//	MessageListModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class MessageListModel : NSObject, NSCoding, NSSecureCoding{
    static var supportsSecureCoding: Bool { return true }
	var fromUser : MessageListFromUser!
	var fromUserID : String!
	var postMessages : String!
	var status : String!
	var toUser : MessageListFromUser!
	var toUserID : String!
	var type : String!
	var createdAt : String!
	var id : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		if let fromUserData = dictionary["FromUser"] as? [String:Any]{
			fromUser = MessageListFromUser(fromDictionary: fromUserData)
		}
		fromUserID = dictionary["FromUserID"] as? String
		postMessages = dictionary["PostMessages"] as? String
		status = dictionary["Status"] as? String
		if let toUserData = dictionary["ToUser"] as? [String:Any]{
			toUser = MessageListFromUser(fromDictionary: toUserData)
		}
		toUserID = dictionary["ToUserID"] as? String
		type = dictionary["Type"] as? String
		createdAt = dictionary["createdAt"] as? String
		id = dictionary["id"] as? String
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
		if fromUser != nil{
			dictionary["FromUser"] = fromUser.toDictionary()
		}
		if fromUserID != nil{
			dictionary["FromUserID"] = fromUserID
		}
		if postMessages != nil{
			dictionary["PostMessages"] = postMessages
		}
		if status != nil{
			dictionary["Status"] = status
		}
		if toUser != nil{
			dictionary["ToUser"] = toUser.toDictionary()
		}
		if toUserID != nil{
			dictionary["ToUserID"] = toUserID
		}
		if type != nil{
			dictionary["Type"] = type
		}
		if createdAt != nil{
			dictionary["createdAt"] = createdAt
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
         fromUser = aDecoder.decodeObject(forKey: "FromUser") as? MessageListFromUser
         fromUserID = aDecoder.decodeObject(forKey: "FromUserID") as? String
         postMessages = aDecoder.decodeObject(forKey: "PostMessages") as? String
         status = aDecoder.decodeObject(forKey: "Status") as? String
         toUser = aDecoder.decodeObject(forKey: "ToUser") as? MessageListFromUser
         toUserID = aDecoder.decodeObject(forKey: "ToUserID") as? String
         type = aDecoder.decodeObject(forKey: "Type") as? String
         createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if fromUser != nil{
			aCoder.encode(fromUser, forKey: "FromUser")
		}
		if fromUserID != nil{
			aCoder.encode(fromUserID, forKey: "FromUserID")
		}
		if postMessages != nil{
			aCoder.encode(postMessages, forKey: "PostMessages")
		}
		if status != nil{
			aCoder.encode(status, forKey: "Status")
		}
		if toUser != nil{
			aCoder.encode(toUser, forKey: "ToUser")
		}
		if toUserID != nil{
			aCoder.encode(toUserID, forKey: "ToUserID")
		}
		if type != nil{
			aCoder.encode(type, forKey: "Type")
		}
		if createdAt != nil{
			aCoder.encode(createdAt, forKey: "createdAt")
		}
		if id != nil{
			aCoder.encode(id, forKey: "id")
		}

	}

}
