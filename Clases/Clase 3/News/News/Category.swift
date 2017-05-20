//
//  Category.swift
//  News
//
//  Created by Gilberto Luna on 18/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class Category: NSObject {

    var name: String
    var image: UIImage
    var newsArray: [News]
    
    init(name: String, image: String){
        self.name = name
        self.image = UIImage(named: image)!
        self.newsArray = [News]()
    }
}
