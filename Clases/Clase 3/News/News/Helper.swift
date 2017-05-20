//
//  Helper.swift
//  News
//
//  Created by Gilberto Luna on 18/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    class func getViewControllerIdentifer()-> String {
        return String(describing: self)
    }
}

extension UITableViewCell{
    class func getCellIdentifier() -> String{
        return String(describing: self)
}
}

    extension UITableView {
        func registerCustomCell(identifier: String){
        let nib = UINib(nibName: identifier, bundle: nil)
            self.register(nib, forCellReuseIdentifier: identifier)
        }
}
