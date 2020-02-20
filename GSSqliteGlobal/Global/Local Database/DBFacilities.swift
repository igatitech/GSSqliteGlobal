//
//  DBFacilities.swift
//  GSSqliteGlobal
//
//  Created by Gati on 27/06/18.
//  Copyright © 2020 iGatiTech. All rights reserved.
//

import UIKit

class DBFacilities : NSObject {
    
    var databasePath = ""
    
    func ExecuteQuery(_ str:String) -> Bool
    {
        databasePath = getDBPath()!
        print("Databse path : \(databasePath)")
        var result:Bool=false
        let DBpath:String = self.databasePath as String
        
        var db: OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        
        let strExec = str.cString(using: String.Encoding.utf8)
        
        if (sqlite3_open(DBpath, &db)==SQLITE_OK)
        {
            if (sqlite3_prepare_v2(db, strExec! , -1, &stmt, nil) == SQLITE_OK)
            {
                if (sqlite3_step(stmt) == SQLITE_DONE)
                {
                    result=true
                }
            }
            sqlite3_finalize(stmt)
        }
        sqlite3_close(db)
        
        return result
    }
    
    func SelectQuery(_ str:String) -> Array<Dictionary<String,String>>
    {
        var result:Array<Dictionary<String,String>>=[]
        databasePath = getDBPath()!
        print("Databse path : \(databasePath)")
        let DBpath:String=self.databasePath as String

        var db: OpaquePointer? = nil
        var stmt:OpaquePointer? = nil

        let strExec=str.cString(using: String.Encoding.utf8)

        if ( sqlite3_open(DBpath,&db) == SQLITE_OK)
        {
            if (sqlite3_prepare_v2(db, strExec! , -1, &stmt, nil) == SQLITE_OK)
            {
                while (sqlite3_step(stmt) == SQLITE_ROW)
                {
                    var i:Int32=0
                    let icount:Int32=sqlite3_column_count(stmt)

                    var dict=Dictionary<String, String>()

                    while i < icount
                    {
                        let strF=sqlite3_column_name(stmt, i)
                        let strV = sqlite3_column_text(stmt, i)

                        let rFiled:String=String(cString: strF!)
                        let rValue:String=String(cString: strV!)

                        dict[rFiled] = rValue

                        i += 1
                    }
                    result.insert(dict, at: result.count)
                }
                sqlite3_finalize(stmt)
            }

            sqlite3_close(db)
        }
        return result
    }

    func getDBPath() -> String? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDir = paths[0]
        return URL(fileURLWithPath: documentsDir).appendingPathComponent(APPLICATION_DB).absoluteString
    }
}
