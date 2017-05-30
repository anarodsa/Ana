//
//  RealmManager.swift
//  Quiz 4
//
//  Created by Gilberto Luna on 30/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {
    
    class func getAllCats() -> Results<Cat>?{
        let realm = try! Realm()
        
        let cats = realm.objects(Cat.self)
        if cats.count > 0 {
            return cats 
        }
        return nil
    }
    
    class func createCats(name: String)
    {
        let cats = Cat()
        cats.name = name
        
        addObjectToRealm(realmObject: cats)
    }

private class func addObjectToRealm(realmObject: Object)
{
    let realm = try! Realm()
    try! realm.write {
        realm.add(realmObject)
    }
}
}
