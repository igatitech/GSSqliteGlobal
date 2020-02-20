//
//  AddUserVC.swift
//  GSSqliteGlobal
//
//  Created by Gati on 07/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
 
public class UserData {
	public var email : String?
	public var firstname : String?
	public var id : String?
	public var lastname : String?

/**
    Returns an array of models based on given dictionary.
    
    Sample usage:
    let userData_list = UserData.modelsFromDictionaryArray(someDictionaryArrayFromJSON)

    - parameter array:  NSArray from JSON dictionary.

    - returns: Array of UserData Instances.
*/
    public class func modelsFromDictionaryArray(array:NSArray) -> [UserData]
    {
        var models:[UserData] = []
        for item in array
        {
            models.append(UserData(dictionary: item as! NSDictionary)!)
        }
        return models
    }

/**
    Constructs the object based on the given dictionary.
    
    Sample usage:
    let userData = UserData(someDictionaryFromJSON)

    - parameter dictionary:  NSDictionary from JSON.

    - returns: UserData Instance.
*/
	required public init?(dictionary: NSDictionary) {

		email = dictionary["email"] as? String
		firstname = dictionary["firstname"] as? String
		id = dictionary["id"] as? String
		lastname = dictionary["lastname"] as? String
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.email, forKey: "email")
		dictionary.setValue(self.firstname, forKey: "firstname")
		dictionary.setValue(self.id, forKey: "id")
		dictionary.setValue(self.lastname, forKey: "lastname")

		return dictionary
	}

}
