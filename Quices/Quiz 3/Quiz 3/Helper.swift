//
//  Helper.swift
//  Quiz 3
//
//  Created by Gilberto Luna on 23/5/17.
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
