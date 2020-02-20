//
//  StringConstant.swift
//  GSSqliteGlobal
//
//  Created by Gati on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation

struct StringConstant {
    //MARK:- COMMON Strings
    struct Common {
        static let ok = "OK"
        static let back = "Back"
        static let cancel = "Cancel"
        static let unknown = "Unknown"
        static let yes = "YES"
        static let no = "NO"
    }
    
    struct CustomMsg {
        static let dataInserted = "Data inserted successfully."
        static let somethingWentWrong = "Something went wrong! Please try again."
        static let dataDeleted = "Data deleted successfully."
        static let dataUpdated = "Data updated successfully."
    }
    
    struct Alert {
        static let delete = "Delete"
        static let deleteMsg = "Are you sure, you want to delete this user?"
    }
}

extension StringConstant {
    struct Validations {
        static let enterFirstName = "Please enter your Firstname"
        static let enterLastName = "Please enter your Lastname"
        static let enterEmail = "Please enter your Email."
        static let notValidEmail = "Please enter valid Email."
    }
}
