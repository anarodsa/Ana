//
//  LanguagesViewController.swift
//  Translate
//
//  Created by Gilberto Luna on 1/6/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

protocol LanguagesViewControllerDelegate: class {
    func closePopover()
}

class LanguagesViewController: UIViewController{

    
    @IBOutlet weak var languagesPickerView: UIPickerView!
    weak var delegate: LanguagesViewControllerDelegate?
    
    @IBAction func languageSelected(_ sender: Any) {        
        delegate?.closePopover()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


}

extension LanguagesViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ""
    }
}
