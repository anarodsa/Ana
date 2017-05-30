//
//  AddDogsViewController.swift
//  Tarea3 Dogs
//
//  Created by Gilberto Luna on 29/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class AddDogsViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate
{

   
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var colorTextField: UITextField!
    
    @IBOutlet weak var imageImage: UIImageView!
    
    var imagenCont: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveDogs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addSaveDogs(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveDogsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveDogsAction(){
        let random:UInt32 = arc4random_uniform(9)
        let imagen: String = "dog" + String(random+1)
        
        RealmManager.createDogs(name: nameTextField.text!, color:  colorTextField.text!, image: imagen)
        navigationController?.popViewController(animated: true)
        
    }

    @IBAction func AgregarImagen(_ sender: UIButton) {
        imagenCont =  UIImagePickerController()
        imagenCont.delegate = self
        imagenCont.sourceType = .photoLibrary
        present(imagenCont,animated: true, completion: nil)    }
    
}
