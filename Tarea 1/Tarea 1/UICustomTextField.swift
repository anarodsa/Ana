//
//  UICustomTextField.swift
//  Tarea 1
//
//  Created by Mauricio Rojas Vindas on 15/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class UICustomTextField: UITextField, UITextFieldDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        switch string {
        case "0","1","2","3","4","5","6","7","8","9", "":
            return true
        default:
            return false
        }
            
    }
}
