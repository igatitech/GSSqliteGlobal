# GSSqliteGlobal

Many times we need a local database for our application. And if we talk about iOS Application Development then we have an inbuilt database called SQLite. SQLite is an embedded database management system.

**GSSqliteGlobal is a lightweight Swift wrapper for SQLite.**

![alt text](https://github.com/igatitech/GSSqliteGlobal/blob/master/Resources/AddUser.png)           ![alt text](https://github.com/igatitech/GSSqliteGlobal/blob/master/Resources/UserList.png)

![](https://github.com/igatitech/GSSqliteGlobal/blob/master/Resources/GSSqliteGlobal.gif)

### Usage

- Clone or Download this project
- Add Library
       - Select Project - Project Target - Build Phases - Link binary with Libraries - click "+" icon 

![alt text](https://github.com/igatitech/GSSqliteGlobal/blob/master/Resources/BuildPhases.png)

- add "libsqlite3.tbd"

![alt text](https://github.com/igatitech/GSSqliteGlobal/blob/master/Resources/Sqlite.png)

- Added library

![alt text](https://github.com/igatitech/GSSqliteGlobal/blob/master/Resources/LinkBinary.png)

- Add **Local Database** folder from this project to your project
- This folder contains Constant header file, Bridging Header file, sqlite file, Database Facility Manager Class
- Rename all the files as per your requirement.
- As you have added Bridging Header file, you need to add it's path in Build Settings(If Bridging Header file is already setup in your project then ignore futhre steps)
- Set Bridging Header Path
    - Select Project - Project Target - Build Settings - Type in the search box - Bridging Header
    
    ![alt text](https://github.com/igatitech/GSSqliteGlobal/blob/master/Resources/BuildSetting.png)
    
    - Add your Bridging Header file (**$(SRCROOT)**/GSSqliteGlobal/Global/Local Database/GSSqliteGlobal-Bridging-Header.h)
    
    ![alt text](https://github.com/igatitech/GSSqliteGlobal/blob/master/Resources/BridgingHeaderPath.png)
    
    - **@note:** It is important to begin your directory path with "$(SRCROOT)", so in future if you move your project to some other machine or directory, it will automatically update the path"

### AppDelegate.swift

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    copyDatabaseIfNeeded()
    return true
}

//MARK: - Database Methods

func copyDatabaseIfNeeded() {
    // Move database file from bundle to documents folder
    
    let fileManager = FileManager.default
    
    let documentsUrl = fileManager.urls(for: .documentDirectory,
                                        in: .userDomainMask)
    guard documentsUrl.count != 0 else {
        return // Could not find documents URL
    }
    let finalDatabaseURL = documentsUrl.first!.appendingPathComponent("DB.sqlite")
    if !( (try? finalDatabaseURL.checkResourceIsReachable()) ?? false) {
        print("DB does not exist in documents folder")
        let documentsURL = Bundle.main.resourceURL?.appendingPathComponent("DB.sqlite")
        do {
            try fileManager.copyItem(atPath: (documentsURL?.path)!, toPath: finalDatabaseURL.path)
        } catch let error as NSError {
            print("Couldn't copy file to final location! Error:\(error.description)")
        }
    } else {
        print("Database file found at path: \(finalDatabaseURL.path)")
    }
}

func getDBPath() -> String? {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let documentsDir = paths[0]
    return URL(fileURLWithPath: documentsDir).appendingPathComponent(APPLICATION_DB).absoluteString
}
```

### Basic Queries :

> Insert into Table 
```swift
func insertIntoTable() {
        
    let dbFacilities = DBFacilities()
    var resultInsert = false
    resultInsert = dbFacilities.ExecuteQuery("INSERT INTO user (firstname, lastname, email) VALUES (\"\(self.textFieldFirstName.text ?? "")\", \"\(self.textFeildLastName.text ?? "")\", \"\(self.textFieldEmail.text ?? "")\")")
    print(resultInsert)
    if resultInsert {
        print("Data inserted successfully in user table")
    } else {
        print("Data not inserted in user table")
    }
}
```

> Update into Table
```swift
func updateIntoTable() {
        
    let dbFacilities = DBFacilities()
    var resultUpdate = false
    resultUpdate = dbFacilities.ExecuteQuery("UPDATE user SET firstname = \"\(self.textFieldFirstName.text ?? "")\", lastname = \"\(self.textFeildLastName.text ?? "")\" where email = \"\(self.textFieldEmail.text ?? "")\"")
    if resultUpdate {
        print("Data updated successfully in user table")
    } else {
        print("Data not updated in user table")
    }
}
```

> Delete from Table
```swift
func deleteFromTable() {
        
    let dbFacilities = DBFacilities()
    var resultDelete = false
    resultDelete = dbFacilities.ExecuteQuery("delete from user where email = \"\(email)\"")
    if resultDelete {
        print("Record deleted successfully")
    } else {
        print("Record not deleted!")
    }
}
```

> Select All Data from Table
```swift
func selectAllDataFromTable() {
        
    let dbFacilities = DBFacilities()
    let arrUserData = dbFacilities.SelectQuery("select * from user")
    print(arrUserData)
}
```
**Happy Coding! Cheers!!** 🥂 

## Author
If you wish to contact me, email at: [gati1993@gmail.com](gati1993@gmail.com)

## License
Copyright 2020 iGatiTech

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

