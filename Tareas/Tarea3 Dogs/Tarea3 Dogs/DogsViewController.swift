//
//  DogsViewController.swift
//  Tarea3 Dogs
//
//  Created by Gilberto Luna on 29/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit
import RealmSwift

class DogsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var dogs: Results<Dogs>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dogs"
        createAddButton()
        tableView.registerCustomCell(identifier: DogTableViewCell.getTableViewCellIdentifier())
        
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        dogs = RealmManager.getAllDogs()
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func createAddButton(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem = addButton
    }
    
    func addAction(){
        let viewController = storyboard!.instantiateViewController(withIdentifier: AddDogsViewController.getViewControllerIdentifier()) as! AddDogsViewController

        navigationController?.pushViewController(viewController, animated: true)
    }

}

extension DogsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dogs = dogs else {
            return 0
        }
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DogTableViewCell.getTableViewCellIdentifier()) as! DogTableViewCell
        cell.setupCell(dogs: dogs![indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250    }
    
}
