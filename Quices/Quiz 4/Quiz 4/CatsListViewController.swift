//
//  CatsListViewController.swift
//  Quiz 4
//
//  Created by Gilberto Luna on 30/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit
import RealmSwift

class CatsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var cats: Results<Cat>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cats"
        createAddButton()
        tableView.registerCustomCell(identifier: CatTableViewCell.getTableViewCellIdentifier())
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        cats = RealmManager.getAllCats()
        tableView.reloadData()
    }
    
    func createAddButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction(){
        let viewController = storyboard!.instantiateViewController(withIdentifier: AddCatViewController.getViewControllerIdentifier()) as! AddCatViewController
        
        navigationController?.pushViewController(viewController, animated: true)
    }

}


extension CatsListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cats = cats else {
            return 0
        }
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CatTableViewCell.getTableViewCellIdentifier()) as! CatTableViewCell
        cell.setupCell(cats: cats![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250    }
    
}
