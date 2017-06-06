//
//  CoreDataManager.swift
//  Tarea4
//
//  Created by Gilberto Luna on 6/6/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//


import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    class func getAllDogs() -> [Dog]
    {
        let result = Dog.mr_findAll()
        
        return result as! [Dog]
    }
    
    class func addDog(name: String, color: String, imageData: NSData)
    {
        let dog = Dog.mr_createEntity()
        dog?.name = name
        dog?.color = color
        dog?.image = imageData
        dog?.orden = 0
        
        saveContext()
    }
    
    private class func saveContext(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
}
