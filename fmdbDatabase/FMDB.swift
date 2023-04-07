//
//  FMDB.swift
//  fmdbDatabase
//
//  Created by R & W on 04/04/23.
//

import Foundation

struct model{
    var id : Int
    var name : String
}

class fmdbHelper {
    static var file : FMDatabase!
    
    static func createFile(){
        
        var x = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        x.appendPathComponent("My FMDB file7.db")
        file = FMDatabase(url: x)
        file.open()
        print(x.path)
        createtable()
        
        
        
    }
    static func createtable(){
        let q = "Create Table if not exists Students(name text,id integer)"
        try? file.executeUpdate(q, values: nil)
        print("create table")
        
    }
    static func addData(id: Int,name:String){
        let q = "insert into Students values ('\(name)',\(id))"
        try? file.executeUpdate(q, values: [name,id])
        print("add data")
       
        
    }
   static func getData() ->[model] {
        var arr = [model]()
        let q = "select * from Students"
        if let data = try? file.executeQuery(q, values: nil){
            while data.next(){
                let id = data.object(forColumn: "id") as? Int ?? 0
                let name = data.object(forColumn: "name") as? String ?? ""
                let obj = model(id: id, name: name)
                arr.append(obj)
            }
            
        }
        
        return arr
    }
    static func deleteData(id: Int,name:String){
        let q = " DELETE FROM Students WHERE id = \(id)"
        try? file.executeUpdate(q, values: nil)
        print("delete data")
        
    }
}
