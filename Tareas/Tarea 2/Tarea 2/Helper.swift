//
//  Helper.swift
//  Tarea 2
//
//  Created by Gilberto Luna on 19/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import Foundation
import UIKit

extension UITableView
{
    
    func registerCustomCell(identifier: String)
    {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: identifier)
    }
}

extension UITableViewCell{
    class func getCellIdentifier() -> String{
        return String(describing: self)
    }
}
