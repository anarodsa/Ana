//
//  RealmManager.swift
//  Tarea3 Dogs
//
//  Created by Gilberto Luna on 30/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {

    class func getAllDogs() -> Results<Dogs>?{
        let realm = try! Realm()
        
        let dogs = realm.objects(Dogs.self)
        if dogs.count > 0 {
            return dogs.sorted(
                byKeyPath: "orden", ascending: false)
        }
        return nil
    }
    
    class func createDogs(name: String, color: String, image: String)
    {
        let dogs = Dogs()
        dogs.color = color
        dogs.name = name
        dogs.image = "A"
        dogs.orden = 0
    
        addObjectToRealm(realmObject: dogs)
    }
    
    private class func getOrden() -> Int{
        let realm = try! Realm()
        
        let dogs = realm.objects(Dogs.self)
        if dogs.count > 0 {
            return dogs.count + 1
        }
        return 1
    }

    private class func addObjectToRealm(realmObject: Object)
    {
        let realm = try! Realm()
        try! realm.write {
            realm.add(realmObject)
        }
    }
}
