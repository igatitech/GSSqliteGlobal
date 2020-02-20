//
//  AddUserVC.swift
//  GSSqliteGlobal
//
//  Created by Gati on 07/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class AddUserVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var textFieldFirstName : UITextField!
    @IBOutlet weak var textFieldLastName : UITextField!
    @IBOutlet weak var textFieldEmail : UITextField!
    
    //MARK:- Variables
    let dbFacilities = DBFacilities()
    
    //MARK:- View Controller view life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        // Do any additional setup after loading the view.
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        
    }
    
    func resetForm() {
        self.textFieldFirstName.text = ""
        self.textFieldLastName.text = ""
        self.textFieldEmail.text = ""
        self.view.endEditing(true)
    }
    
    //MARK:- IBActions
    @IBAction func buttonAddClicked(_ sender : Any) {
        if isValidate() {
            insertIntoTable()
        }
    }
    
    @IBAction func buttonUpateClicked(_ sender : Any){
        if isValidate() {
            updateIntoTable()
        }
    }
    
    @IBAction func buttonViewDataClicked(_ sender : Any) {
        guard let vcUserList = GetViewController(StoryBoard: .User, Identifier: .UserList) else { return}
        self.navigationController?.pushViewController(vcUserList, animated: true)
    }
    
    //MARK:- Database Methods
    func insertIntoTable() {
        var resultInsert = false
        resultInsert = dbFacilities.ExecuteQuery("INSERT INTO user (firstname, lastname, email) VALUES (\"\(self.textFieldFirstName.text ?? "")\", \"\(self.textFieldLastName.text ?? "")\", \"\(self.textFieldEmail.text ?? "")\")")
        print(resultInsert)
        if resultInsert == true {
            
            resetForm()
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.CustomMsg.dataInserted, duration: 0.4)
        } else {
            resetForm()
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.CustomMsg.somethingWentWrong, duration: 0.4)
        }
    }
    
    func updateIntoTable() {
        
        var resultUpdate = false
        resultUpdate = dbFacilities.ExecuteQuery("UPDATE user SET firstname = \"\(self.textFieldFirstName.text ?? "")\", lastname = \"\(self.textFieldLastName.text ?? "")\" where email = \"\(self.textFieldEmail.text ?? "")\"")
        if resultUpdate {
            resetForm()
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.CustomMsg.dataUpdated, duration: 0.4)
        } else {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.CustomMsg.somethingWentWrong, duration: 0.4)
        }
    }
}

//MARK:- TextField Delegate
extension AddUserVC : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.changeResponder(textFields: [textFieldFirstName, textFieldLastName, textFieldEmail])
        return true
    }
}

//MARK:- Validations
extension AddUserVC {
    func isValidate() -> Bool {
        if self.textFieldFirstName.text?.isBlank() ?? true {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Validations.enterFirstName, duration: 0.4)
            return false
        } else if self.textFieldLastName.text?.isBlank() ?? true {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Validations.enterLastName, duration: 0.4)
            return false
        } else if self.textFieldEmail.text?.isBlank() ?? true {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Validations.enterEmail, duration: 0.4)
            return false
        } else if !isValidEmail(self.textFieldEmail.text ?? "") {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.Validations.notValidEmail, duration: 0.4)
            return false
        }
        return true
    }
}
