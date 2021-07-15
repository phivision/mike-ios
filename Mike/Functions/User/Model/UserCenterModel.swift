//
//	UserCenterModel.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation


class UserCenterModel : NSObject, NSCoding{

	var bgImage : String?
	var bgTitle : String?
	var biography : String?
	var birthday : String?
	var contents : UserCenterContent!
	var descriptionField : String?
	var email : String!
	var favorites : UserCenterFavorite!
	var firstName : String!
	var gender : String!
	var height : Int!
	var lastName : String!
	var regDate : String!
	var subscriptions : UserCenterFavorite!
	var userImage : String!
	var userRole : String!
	var weight : Int!
	var createdAt : String!
	var id : String!
	var owner : String!
	var updatedAt : String!
    var TokenPrice: Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: [String:Any]){
		bgImage = dictionary["BgImage"] as? String
		bgTitle = dictionary["BgTitle"] as? String
		biography = dictionary["Biography"] as? String
		birthday = dictionary["Birthday"] as? String
		if let contentsData = dictionary["Contents"] as? [String:Any]{
			contents = UserCenterContent(fromDictionary: contentsData)
		}
		descriptionField = dictionary["Description"] as? String
		email = dictionary["Email"] as? String
		if let favoritesData = dictionary["Favorites"] as? [String:Any]{
			favorites = UserCenterFavorite(fromDictionary: favoritesData)
		}
		firstName = dictionary["FirstName"] as? String
		gender = dictionary["Gender"] as? String
		height = dictionary["Height"] as? Int
		lastName = dictionary["LastName"] as? String
		regDate = dictionary["RegDate"] as? String
		if let subscriptionsData = dictionary["Subscriptions"] as? [String:Any]{
			subscriptions = UserCenterFavorite(fromDictionary: subscriptionsData)
		}
		userImage = dictionary["UserImage"] as? String
		userRole = dictionary["UserRole"] as? String
		weight = dictionary["Weight"] as? Int
		createdAt = dictionary["createdAt"] as? String
		id = dictionary["id"] as? String
		owner = dictionary["owner"] as? String
		updatedAt = dictionary["updatedAt"] as? String
        TokenPrice = dictionary["TokenPrice"] as? Int
	}

	/**
	 * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> [String:Any]
	{
		var dictionary = [String:Any]()
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
		if contents != nil{
			dictionary["Contents"] = contents.toDictionary()
		}
		if descriptionField != nil{
			dictionary["Description"] = descriptionField
		}
		if email != nil{
			dictionary["Email"] = email
		}
		if favorites != nil{
			dictionary["Favorites"] = favorites.toDictionary()
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
		if subscriptions != nil{
			dictionary["Subscriptions"] = subscriptions.toDictionary()
		}
		if userImage != nil{
			dictionary["UserImage"] = userImage
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
        if TokenPrice != nil {
            dictionary["TokenPrice"] = TokenPrice
        }
		return dictionary
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         bgImage = aDecoder.decodeObject(forKey: "BgImage") as? String
         bgTitle = aDecoder.decodeObject(forKey: "BgTitle") as? String
         biography = aDecoder.decodeObject(forKey: "Biography") as? String
         birthday = aDecoder.decodeObject(forKey: "Birthday") as? String
         contents = aDecoder.decodeObject(forKey: "Contents") as? UserCenterContent
         descriptionField = aDecoder.decodeObject(forKey: "Description") as? String
         email = aDecoder.decodeObject(forKey: "Email") as? String
         favorites = aDecoder.decodeObject(forKey: "Favorites") as? UserCenterFavorite
         firstName = aDecoder.decodeObject(forKey: "FirstName") as? String
         gender = aDecoder.decodeObject(forKey: "Gender") as? String
         height = aDecoder.decodeObject(forKey: "Height") as? Int
         lastName = aDecoder.decodeObject(forKey: "LastName") as? String
         regDate = aDecoder.decodeObject(forKey: "RegDate") as? String
         subscriptions = aDecoder.decodeObject(forKey: "Subscriptions") as? UserCenterFavorite
         userImage = aDecoder.decodeObject(forKey: "UserImage") as? String
         userRole = aDecoder.decodeObject(forKey: "UserRole") as? String
         weight = aDecoder.decodeObject(forKey: "Weight") as? Int
         createdAt = aDecoder.decodeObject(forKey: "createdAt") as? String
         id = aDecoder.decodeObject(forKey: "id") as? String
         owner = aDecoder.decodeObject(forKey: "owner") as? String
         updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as? String
        TokenPrice = aDecoder.decodeObject(forKey: "TokenPrice") as? Int
	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
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
		if contents != nil{
			aCoder.encode(contents, forKey: "Contents")
		}
		if descriptionField != nil{
			aCoder.encode(descriptionField, forKey: "Description")
		}
		if email != nil{
			aCoder.encode(email, forKey: "Email")
		}
		if favorites != nil{
			aCoder.encode(favorites, forKey: "Favorites")
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
		if subscriptions != nil{
			aCoder.encode(subscriptions, forKey: "Subscriptions")
		}
		if userImage != nil{
			aCoder.encode(userImage, forKey: "UserImage")
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
        if TokenPrice != nil {
            aCoder.encode(TokenPrice,forKey: "TokenPrice")
        }
	}

}
