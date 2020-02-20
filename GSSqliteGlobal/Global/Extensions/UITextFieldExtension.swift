//
//  UITextFieldExtension.swift
//  GSBaseMVC
//
//  Created by Gati on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

extension UITextField {

    func changeResponder(textFields : [UITextField]) {
        for i in 0..<textFields.count {
            let textfield = textFields[i]
            if textfield == self {
                if i < textFields.count-1 {
                    let textfield = textFields[i+1]
                    textfield.becomeFirstResponder()
                    break
                } else {
                    textfield.resignFirstResponder()
                    break
                }
            }
        }
    }
}

