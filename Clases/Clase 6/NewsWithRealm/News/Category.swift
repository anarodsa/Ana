//
//  Category.swift
//  News
//
//  Created by Gilberto Luna on 18/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

enum CategoryType{
    case economy, sports, incident,technology
}


class Category: NSObject {

    var name: String
    var image: UIImage
    var newsArray: [News]
    var type: CategoryType
    
    
    init(name: String, image: String, type: CategoryType){
        self.name = name
        self.image = UIImage(named: image)!
        self.type = type
        newsArray = [News]()
    }
}
