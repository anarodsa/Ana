//
//  Newa.swift
//  News
//
//  Created by Gilberto Luna on 18/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class News: NSObject {

    var titleNews: String
    var descriptionNews: String
    var createdAt: Date
    
    init(titleNews: String, descriptionNews: String, createdAt: Date ){
        self.titleNews = titleNews
        self.descriptionNews = descriptionNews
        self.createdAt = createdAt
    }
    
}
