//
//  UIViewControllerExtension.swift
//  GSSqliteGlobal
//
//  Created by Gati on 21/10/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

extension  UIViewController {

    /**
    Call this function for showing alert for displaying information with OK button in your View Controller class.
    - Parameters:
        - title: Pass your alert title in String
        - message: Pass your alert message in String.
    */
    func showAlert(withTitle title: String, withMessage message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: StringConstant.Common.ok, style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
    }
    
    /**
    Call this function for showing alert with OK and Cancel button in your View Controller class.
    - Parameters:
        - title: Pass your alert title in String
        - message: Pass your alert message in String.
        - okClickHandler: This will give you call back inside block when OK button is clicked
        - cancelClickHandler: This will give you call back inside block when Cancel button is clicked
    */
    func showAlertWithActions(title: String, andMessage message: String , okClickHandler :@escaping(UIAlertAction) -> Void, cancelClickHandler :@escaping(UIAlertAction) -> Void){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: StringConstant.Common.ok, style: UIAlertAction.Style.default, handler: okClickHandler))
            alert.addAction(UIAlertAction(title: StringConstant.Common.cancel, style: UIAlertAction.Style.cancel, handler: cancelClickHandler))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
