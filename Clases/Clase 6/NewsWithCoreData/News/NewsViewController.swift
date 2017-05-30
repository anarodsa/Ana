//
//  NewsViewController.swift
//  News
//
//  Created by Gilberto Luna on 18/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

protocol NewsViewControllerDelegate : class{
    func addNews(news: [News], categoryType: CategoryType)
}


class NewsViewController: UIViewController {

    var news: [News]?
    var categoryType: CategoryType?
    weak var delegate: NewsViewControllerDelegate?
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerCustomCell(identifier: NewsTableViewCell.getCellIdentifier())
        createAddButton()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let news = news, let categoryType = categoryType{
            delegate?.addNews(news: news, categoryType: categoryType)
        }
    }
    
    func createAddButton(){
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        
        navigationItem.rightBarButtonItem = addButton
        
    }
    
    func addAction(){
        
        let viewController = storyboard?.instantiateViewController(withIdentifier: NewsDetailTableViewController.getViewControllerIdentifer()) as! NewsDetailTableViewController
        viewController.delegate = self
        
        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = news else {
            return 0
        }
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.getCellIdentifier()) as! NewsTableViewCell
        
        cell.setupCell(news: news![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension NewsViewController: NewsTableViewControllerDelegate{
    func addNews(news: News) {
        self.news?.append(news)
        tableView.reloadData()
    }
}
