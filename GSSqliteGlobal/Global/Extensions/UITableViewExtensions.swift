//
//  UITableViewExtensions.swift
//  BaseProject_MVC
//
//  Created by Gati Shah on 02/08/19.
//  Copyright © 2019 Gati Shah. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func registerTablViewCell(cellIdentifier : String)  {
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: cellIdentifier)
        self.tableFooterView = UIView()
        self.setSepratoreToZero()
    }
    
    func setSepratoreToZero() {
        self.preservesSuperviewLayoutMargins = false
        self.separatorInset = UIEdgeInsets.zero
        self.layoutMargins = UIEdgeInsets.zero
    }

    func nextResponder(index: Int){
        var currIndex = -1
        for i in index+1..<index+100{
            if let view = self.superview?.superview?.viewWithTag(i){
                view.becomeFirstResponder()
                currIndex = i
                break
            }
        }

        let ind = IndexPath(row: currIndex - 100, section: 0)
        if let nextCell = self.cellForRow(at: ind){
            self.scrollRectToVisible(nextCell.frame, animated: true)
        }
    }
}
