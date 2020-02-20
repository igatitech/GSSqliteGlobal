//
//  Functions.swift
//  GSSqliteGlobal
//
//  Created by Gati on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

func print(_ items: Any...)  {
    #if DEBUG
    Swift.print(items[0])
    #endif
}

//MARK:- Print Fonts
func printFonts() {
    let fontFamilyNames = UIFont.familyNames
    for familyName in fontFamilyNames {
        print("------------------------------")
        print("Font Family Name = [\(familyName)]")
        let names = UIFont.fontNames(forFamilyName: familyName)
        print("Font Names = [\(names)]")
    }
}

//MARK:- Get View Controller
func GetViewController(StoryBoard : Storyboards,Identifier : ControllerIdentifier) ->UIViewController?{
    
    return UIStoryboard(name: StoryBoard.rawValue, bundle: nil).instantiateViewController(withIdentifier: Identifier.rawValue)
}

//MARK:- Get Navigation Controller
func GetNavigationController(StoryBoard : Storyboards,Identifier : NavigationControllerIdentifier) ->UINavigationController?{
    
    guard let NavigationVC = UIStoryboard(name: StoryBoard.rawValue, bundle: nil).instantiateViewController(withIdentifier: Identifier.rawValue) as? UINavigationController else{
        print("Navigation Controller with provided identifier not found!")
        return nil
    }
    return NavigationVC
}

//MARK:- Get Current Navigation Controller
func GetCurrentNavigationController() -> UINavigationController?{
    
    return UIApplication.shared.windows.first?.rootViewController?.navigationController
}

//MARK:- Get Top Most View Controller
func topMostViewController() -> UIViewController {
    var topViewController: UIViewController? = UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController
    while ((topViewController?.presentedViewController) != nil) {
        topViewController = topViewController?.presentedViewController
    }
    return topViewController!
}

//MARK: Method for validating email
func isValidEmail(_ testStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

//MARK:- Method for validating password
//Password should contain \n- At least 1 uppercase letter \n- At least 1 lowercase letter \n- A number \n- A symbol: !£$%^&amp;*()_+=[]{}/?'@:; \n- Have more than 7 characters
func isValidPassword(_ testStr:String) -> Bool {
    let passwordRegEx = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$"
    let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
    return passwordTest.evaluate(with: testStr)
}

//MARK:- Method to Ierate through Enum
func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
    var i = 0
    return AnyIterator {
        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
        if next.hashValue != i { return nil }
        i += 1
        return next
    }
}

//MARK:- SetUp TextFields in the Screen
func setUpTextFields(textFields : [UITextField], placeholders : [String]) {
    for (index, textField) in textFields.enumerated() {
        textField.placeholder = placeholders[index]
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.textColor = .black
    }
}

