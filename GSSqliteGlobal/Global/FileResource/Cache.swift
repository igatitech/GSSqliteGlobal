//
//  Cache.swift
//  GSSqliteGlobal
//
//  Created by Gati on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

enum CacheKeys : String{
    case currentUser = "currentUser"
    case isUserLogin = "isUserLogin"
}

//MARK:- String
func saveStringToDefaults(string : String, key : CacheKeys) {
    UserDefaults.standard.setValue(string, forKey: key.rawValue)
    UserDefaults.standard.synchronize()
}

func getStringFromDefaults(key : CacheKeys) -> String? {
    if let str = UserDefaults.standard.value(forKey: key.rawValue) as? String {
        return str
    }
    return nil
}

//MARK:- Bool
func saveBoolToDefaults(bool : Bool, key : CacheKeys) {
    UserDefaults.standard.setValue(bool, forKey: key.rawValue)
    UserDefaults.standard.synchronize()
}

func getBoolFromDefaults(key : CacheKeys) -> Bool? {
    if let bool = UserDefaults.standard.value(forKey: key.rawValue) as? Bool {
        return bool
    }
    return nil
}

//MARK:- Int
func saveIntToDefault(int : Int, key : CacheKeys) {
    UserDefaults.standard.setValue(int, forKey: key.rawValue)
    UserDefaults.standard.synchronize()
}

func getIntFromDefaults(key : CacheKeys) -> Int? {
    if let int = UserDefaults.standard.value(forKey: key.rawValue) as? Int {
        return int
    }
    return nil
}


//MARK:- Dictionary
func saveDictionaryToDefaults(dicitonary : NSDictionary,key : CacheKeys){
    UserDefaults.standard.setValue(dicitonary,forKey: key.rawValue)
    UserDefaults.standard.synchronize()
}

func getDictionaryFromDefaults(key : CacheKeys) ->NSDictionary?{
    
    if let dict = UserDefaults.standard.value(forKey: key.rawValue) as? NSDictionary{
        
        return dict
    }
    return nil
}

//MARK:- Array
func saveArrayToDefaults(array : NSMutableArray, key : CacheKeys) {
    
    UserDefaults.standard.setValue(array,forKey: key.rawValue)
    UserDefaults.standard.synchronize()
}

func getArrayFromDefaults(key : CacheKeys) ->NSArray?{
    
    if let array = UserDefaults.standard.value(forKey: key.rawValue) as? NSArray{
        return array
    }
    return nil
}

//MARK:- ClearCacheData
func removeAllCacheData(){
    for key in iterateEnum(CacheKeys.self){
            UserDefaults.standard.removeObject(forKey: key.rawValue)
            UserDefaults.standard.synchronize()
    }
}




