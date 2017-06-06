//
//  ViewController.swift
//  Tarea 1
//
//  Created by Gilberto Luna on 14/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtSegundo: UITextField!
    @IBOutlet weak var txtPrimero: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnSumar(_ sender: UIButton) {
        
        var result = 0
        
        if let primero = Int(txtPrimero.text!), let segundo = Int(txtSegundo.text!) {
        
            result = primero + segundo
            
            let alertController = UIAlertController(title : "Información", message : "El resultado es \(result)", preferredStyle: .alert)
            let action = UIAlertAction(title :"OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }

    }

    
    @IBAction func btnRestar(_ sender: UIButton) {
        var result = 0
        if let primero = Int(txtPrimero.text!), let segundo = Int(txtSegundo.text!) {
            
        result = primero - segundo
        
        let alertController = UIAlertController(title : "Información", message : "El resultado es \(result)", preferredStyle: .alert)
        let action = UIAlertAction(title :"OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnDividir(_ sender: UIButton) {
        var result = 0
        if let primero = Int(txtPrimero.text!), let segundo = Int(txtSegundo.text!) {
            if segundo == 0 {return}
            
            result = primero / segundo
        
            let alertController = UIAlertController(title : "Información", message : "El resultado es \(result)", preferredStyle: .alert)
            let action = UIAlertAction(title :"OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnMultiplicar(_ sender: UIButton) {
        var result = 0
        if let primero = Int(txtPrimero.text!), let segundo = Int(txtSegundo.text!) {
        result = primero * segundo
        
        let alertController = UIAlertController(title : "Información", message : "El resultado es \(result)", preferredStyle: .alert)
        let action = UIAlertAction(title :"OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func txtPrimeroValida(_ sender: Any) {
    }
    
}

