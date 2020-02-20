//
//  UserListVC.swift
//  GSSqliteGlobal
//
//  Created by Gati on 07/02/20.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class UserListVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tableViewUsers : UITableView!
    
    //MARK:- Variables
    let dbFacilities = DBFacilities()
    var arrUserData = [UserData]()
    
    //MARK:- View Controller view life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK:- Custom Methods
    func setUpView() {
        tableViewUsers.registerTablViewCell(cellIdentifier: CellIdentifier.UserTableCell)
        tableViewUsers.setDynamicCellHeight()
        selectAllDataFromTable()
    }
    
    //MARK:- IBActions
    @IBAction func buttonBackClicked(_ sender : Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Database Methods
    func selectAllDataFromTable() {
        let arrUser = dbFacilities.SelectQuery("select * from user")
        arrUserData = UserData.modelsFromDictionaryArray(array: arrUser as NSArray)
        print(arrUserData)
        tableViewUsers.reloadData()
    }
    
    func deleteFromTable(email : String) {
        var resultDelete = false
        resultDelete = dbFacilities.ExecuteQuery("delete from user where email = \"\(email)\"")
        if resultDelete {
            arrUserData.removeAll { (userData) -> Bool in
                return userData.email == email
            }
            tableViewUsers.reloadData()
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.CustomMsg.dataDeleted, duration: 0.4)
        } else {
            UIApplication.shared.windows.last?.showToast(toastMessage: StringConstant.CustomMsg.somethingWentWrong, duration: 0.4)
        }
    }
}

extension UserListVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrUserData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.UserTableCell) as! UserTableCell
        cell.userData = arrUserData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.showAlertWithActions(title: StringConstant.Alert.delete, andMessage: StringConstant.Alert.deleteMsg, okClickHandler: { (okAction) in
                self.deleteFromTable(email: self.arrUserData[indexPath.row].email ?? "")
            }) { (cancelAction) in
                print("Do Nothing!")
            }
            
        }
    }
}
