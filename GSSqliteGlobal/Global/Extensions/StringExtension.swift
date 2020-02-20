//
//  StringExtension.swift
//  GSSqliteGlobal
//
//  Created by Gati on 02/08/19.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func isBlank() -> Bool {
        if self.trimmingCharacters(in: .whitespaces).count == 0 {
            return true
        } else {
            return false
        }
    }
}
