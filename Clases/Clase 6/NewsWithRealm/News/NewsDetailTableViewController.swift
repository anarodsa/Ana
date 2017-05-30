//
//  NewsDetailTableViewController.swift
//  News
//
//  Created by Gilberto Luna on 23/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

protocol NewsTableViewControllerDelegate: class {
    func addNews(news: News)
}


class NewsDetailTableViewController: UITableViewController {

    @IBOutlet weak var VistaTextView: UITextView!
    @IBOutlet weak var txtTextField: UITextField!
    
    weak var delegate: NewsTableViewControllerDelegate?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()      
    }
    
    func addSaveNews(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction(){
        let news = News(titleNews: txtTextField.text!, descriptionNews: VistaTextView.text!, createdAt: Date())
        delegate?.addNews(news: news)
        
        navigationController?.popViewController(animated: true)
    }
    
    
}
