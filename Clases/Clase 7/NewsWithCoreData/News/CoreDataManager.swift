//
//  CoreDataManager.swift
//  News
//
//  Created by Gilberto Luna on 30/5/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit
import CoreData


class CoreDataManager: NSObject {
    
    class func getAllCategories() -> [Category]{
        let result = Category.mr_findAll() // se trae todos
        
        if result!.count == 0 {
            return createDefualtCategory()
        }
        return result as! [Category]E
        
        }
    

    class func createDefualtCategory() -> [Category]{
        
        createCategory(name: "Economia", imageName: "economy")
        createCategory(name: "Sucesos", imageName: "incident")
        createCategory(name: "Deportes", imageName: "sports")
        createCategory(name: "Tecnología", imageName: "technology")
        saveContext()
        return getAllCategories()
    }
    
    class func addNews(category: Category, title: String, description: String){
        let news = News.mr_createEntity()
        news?.title = title
        news?.descriptionNews = description
        news?.createdAt = Date()
        
        category.addNewsObject(news!)
        saveContext()
    }
    
    private class func createCategory(name: String, imageName: String){
        let category = Category.mr_createEntity()
        
        category?.name = name
        category?.imageName = imageName
    }
    
    private class func saveContext(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
}
