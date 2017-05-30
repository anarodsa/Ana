//
//  AddCatViewController.swift
//  Quiz 4
//
//  Created by Gilberto Luna on 30/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class AddCatViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveCats()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func addSaveCats(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveCatsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveCatsAction(){
        
        RealmManager.createCats(name: nameTextField.text!)
        navigationController?.popViewController(animated: true)
        
    }

}
