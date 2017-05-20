//
//  CategoryViewController.swift
//  News
//
//  Created by Gilberto Luna on 18/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    var categories = [Category]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeCategories()
        tableView.registerCustomCell(identifier: CategoryTableViewCell.getCellIdentifier())
        
        
        self.title = "Categories"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeCategories() {
        
        let economyCategory = Category(name: "Economía", image: "economy")
        let sportsCategory = Category(name: "Sport", image: "sports")
        let technologyCategory = Category(name: "Technology", image: "technology")
        let incidentCategory = Category(name: "Sucesos", image: "incident")
        categories = [economyCategory, sportsCategory,technologyCategory,incidentCategory]
    }
}


extension CategoryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.getCellIdentifier()) as! CategoryTableViewCell
        cell.setupCell(category: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newsViewController =  storyboard?.instantiateViewController(withIdentifier: NewsViewController.getViewControllerIdentifer()) as! NewsViewController
        
        newsViewController.news = categories[indexPath.row].newsArray
        navigationController?.pushViewController(newsViewController, animated: true)
    }
    
}
