//
//  newsDetailTableViewController.swift
//  News
//
//  Created by Mauricio Rojas Vindas on 23/5/17.
//  Copyright © 2017 César Brenes Solano. All rights reserved.
//

import UIKit

protocol NewsDetailTableViewControllerDelegate: class {
    func addNews(news: News)
}

class newsDetailTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    weak var delegate: NewsDetailTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSaveNews()
    }
    
    func addSaveNews(){
        let saveAction = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveNewsAction))
        navigationItem.rightBarButtonItem = saveAction
    }
    
    func saveNewsAction(){
        let news = News(titleNews: titleTextField.text!, descriptionNews: descriptionTextView.text!, createdAt: Date())
        delegate?.addNews(news: news)
        navigationController?.popViewController(animated: true)
    }

}
