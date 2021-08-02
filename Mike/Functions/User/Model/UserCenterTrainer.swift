//
//	UserCenterTrainer.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserCenterTrainer : NSObject, NSCoding,NSSecureCoding{
    static var supportsSecureCoding: Bool { return true }
	var bgImage : String!
	var bgTitle : String!
	var biography : String!
	var birthday : String!
	var descriptionField : String!
	var email : String!
	var firstName : String!
	var gender : String!
	var height : Float!
	var lastName : String!
	var regDate : String!
	var stripeID : String!
	var tokenPrice : Int!
	var userImage : String!
	var userMessageGroup : UserCenterUserMessageGroup?
	var userRole : String!
	var weight : Float!
	var createdAt : String!
	var id : String!
	var owner : String!
	var updatedAt : String!
    var subscriptionPrice: Int!
    var expireDate: String!
    var cancelAtPeriodEnd: Bool!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		expireDate = dictionary["ExpireDate"] as? String
        cancelAtPeriodEnd = dictionary["CancelAtPeriodEnd"] as? Bool
        bgImage = dictionary["BgImage"] as? String
		bgTitle = dictionary["BgTitle"] as? String
		biography = dictionary["Biography"] as? String
		birthday = dictionary["Birthday"] as? String
		descriptionField = dictionary["Description"] as? String
		email = dictionary["Email"] as? String
		firstName = dictionary["FirstName"] as? String
		gender = dictionary["Gender"] as? String
		height = dictionary["Height"] as? Float
		lastName = dictionary["LastName"] as? String
		regDate = dictionary["RegDate"] as? String
		stripeID = dictionary["StripeID"] as? String
		tokenPrice = dictionary["TokenPrice"] as? Int
		userImage = dictionary["UserImage"] as? String
		if let userMessageGroupData = dictionary["UserMessageGroup"] as? [String:Any]{
			userMessageGroup = UserCenterUserMessageGroup(fromDictionary: userMessageGroupData)
		}
		userRole = dictionary["UserRole"] as? String
		weight = dictionary["Weight"] as? Float
		createdAt = dictionary["createdAt"] as? String
		id = dictionary["id"] as? String
		owner = dictionary["owner"] as? String
		updatedAt = dictionary["updatedAt"] as? String
        subscriptionPrice = dictionary["SubscriptionPrice"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
        if expireDate != nil{
            dictionary["ExpireDate"] = expireDate
        }
        if cancelAtPeriodEnd != nil{
            dictionary["CancelAtPeriodEnd"] = cancelAtPeriodEnd
        }
		if bgImage != nil{
			dictionary["BgImage"] = bgImage
		}
		if bgTitle != nil{
			dictionary["BgTitle"] = bgTitle
		}
		if biography != nil{
			dictionary["Biography"] = biography
		}
		if birthday != nil{
			dictionary["Birthday"] = birthday
		}
		if descriptionField != nil{
			dictionary["Description"] = descriptionField
		}
		if email != nil{
			dictionary["Email"] = email
		}
		if firstName != nil{
			dictionary["FirstName"] = firstName
		}
		if gender != nil{
			dictionary["Gender"] = gender
		}
		if height != nil{
			dictionary["Height"] = height
		}
		if lastName != nil{
			dictionary["LastName"] = lastName
		}
		if regDate != nil{
			dictionary["RegDate"] = regDate
		}
		if stripeID != nil{
			dictionary["StripeID"] = stripeID
		}
		if tokenPrice != nil{
			dictionary["TokenPrice"] = tokenPrice
		}
		if userImage != nil{
			dictionary["UserImage"] = userImage
		}
		if userMessageGroup != nil{
            dictionary["UserMessageGroup"] = userMessageGroup?.toDictionary()
		}
		if userRole != nil{
			dictionary["UserRole"] = userRole
		}
		if weight != nil{
			dictionary["Weight"] = weight
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
        if subscriptionPrice != nil {
            dictionary["SubscriptionPrice"] = subscriptionPrice
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
        expireDate = aDecoder.decodeObject(forKey: "ExpireDate") as? String
        cancelAtPeriodEnd = aDecoder.decodeObject(forKey: "CancelAtPeriodEnd") as? Bool
         bgImage = aDecoder.decodeObject(forKey: "BgImage") as? String
         bgTitle = aDecoder.decodeObject(forKey: "BgTitle") as? String
         biography = aDecoder.decodeObject(forKey: "Biography") as? String
         birthday = aDecoder.decodeObject(forKey: "Birthday") as? String
         descriptionField = aDecoder.decodeObject(forKey: "Description") as? String
         email = aDecoder.decodeObject(forKey: "Email") as? String
         firstName = aDecoder.decodeObject(forKey: "FirstName") as? String
         gender = aDecoder.decodeObject(forKey: "Gender") as? String
         height = aDecoder.decodeObject(forKey: "Height") as? Float
         lastName = aDecoder.decodeObject(forKey: "LastName") as? String
         regDate = aDecoder.decodeObject(forKey: "RegDate") as? String
        stripeID = aDecoder.decodeObject(forKey: "StripeID") as? String
         tokenPrice = aDecoder.decodeObject(forKey: "TokenPrice") as? Int
         userImage = aDecoder.decodeObject(forKey: "UserImage") as? String
         userMessageGroup = aDecoder.decodeObject(forKey: "UserMessageGroup") as? UserCenterUserMessageGroup
         userRole = aDecoder.decodeObject(forKey: "UserRole") as? String
         weight = aDecoder.decodeObject(forKey: "Weight") as? Float
         createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         owner = aDecoder.decodeObject(forKey: "owner") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as? String
        subscriptionPrice = aDecoder.decodeObject(forKey: "SubscriptionPrice") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
        if expireDate != nil{
            aCoder.encode(expireDate, forKey: "ExpireDate")
        }
        if cancelAtPeriodEnd != nil{
            aCoder.encode(cancelAtPeriodEnd, forKey: "CancelAtPeriodEnd")
        }
		if bgImage != nil{
			aCoder.encode(bgImage, forKey: "BgImage")
		}
		if bgTitle != nil{
			aCoder.encode(bgTitle, forKey: "BgTitle")
		}
		if biography != nil{
			aCoder.encode(biography, forKey: "Biography")
		}
		if birthday != nil{
			aCoder.encode(birthday, forKey: "Birthday")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "Description")
		}
		if email != nil{
			aCoder.encode(email, forKey: "Email")
		}
		if firstName != nil{
			aCoder.encode(firstName, forKey: "FirstName")
		}
		if gender != nil{
			aCoder.encode(gender, forKey: "Gender")
		}
		if height != nil{
			aCoder.encode(height, forKey: "Height")
		}
		if lastName != nil{
			aCoder.encode(lastName, forKey: "LastName")
		}
		if regDate != nil{
			aCoder.encode(regDate, forKey: "RegDate")
		}
		if stripeID != nil{
			aCoder.encode(stripeID, forKey: "StripeID")
		}
		if tokenPrice != nil{
			aCoder.encode(tokenPrice, forKey: "TokenPrice")
		}
		if userImage != nil{
			aCoder.encode(userImage, forKey: "UserImage")
		}
		if userMessageGroup != nil{
			aCoder.encode(userMessageGroup, forKey: "UserMessageGroup")
		}
		if userRole != nil{
			aCoder.encode(userRole, forKey: "UserRole")
		}
		if weight != nil{
			aCoder.encode(weight, forKey: "Weight")
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
        if subscriptionPrice != nil {
            aCoder.encode(subscriptionPrice,forKey: "SubscriptionPrice")
        }

	}

}
