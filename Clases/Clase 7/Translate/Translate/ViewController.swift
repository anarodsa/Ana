//
//  ViewController.swift
//  Translate
//
//  Created by Gilberto Luna on 30/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {

   
    @IBOutlet weak var oroginLanguageTextView: UITextView!
    
    @IBOutlet weak var destinationLenguageTextView: UITextView!
    
    @IBOutlet weak var originLanguageLabel: UILabel!
    @IBOutlet weak var destinationLanguageLabel: UILabel!
    
    var languagesArray: [[String:String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
        showActivityIndicator()
        ApiManager.getLanguages()
        
    }
    
    func registerNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(getLanguagesAviable(notification:)), name: Notification.Name(Constants.GET_LANGUAGES_NOTIFICACION), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(registerErrorNotification), name: Notification.Name(Constants.ERROR_FOUND_NOTIFICACION), object: nil)
        
    }
    
    func registerErrorNotification(){
        hideActivityIndicator()
        let alertController = UIAlertController(title: "Error", message: "No funciona, trate despues", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
        
    }
    
    func getLanguagesAviable(notification: Notification){
        
        languagesArray = notification.userInfo![Constants.LANGUAGE_KEY] as? [[String: String]]
        hideActivityIndicator()
        
//        print("EL TAMAÑO DEL ARRAY ES DE \(languagesArray.count)")
    }
    
    func showActivityIndicator(){
        DispatchQueue.main.async {
            let size = CGSize(width: 35, height: 35)
            self.startAnimating(size, message: nil, type: NVActivityIndicatorType.pacman)
        }
    }
    
    func hideActivityIndicator(){
        DispatchQueue.main.async {
            self.stopAnimating()
        }
    }
    

    @IBAction func originLanguageAction(_ sender: Any) {
        let languagesViewController = storyboard?.instantiateViewController(withIdentifier: "LanguagesViewController") as! LanguagesViewController
        languagesViewController.modalPresentationStyle = .overCurrentContext
        present(languagesViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func destinationLanguageAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func changeLenguageAction(_ sender: Any) {
        
    }
    
    
}

extension ViewController: LanguagesViewControllerDelegate{
    func closePopover(){
        dismiss(animated: true, completion: nil)
    }
    
}


