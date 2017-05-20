//
//  NumbersViewController.swift
//  Quiz 2
//
//  Created by Gilberto Luna on 18/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {

    var array = [Int]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array = RetornaArray()
        
        tableView.registerCustomCell(identifier: NumbersTableViewCell.getCellIdentifier())
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func RetornaArray () -> [Int]
    {
        var array = [Int]()
       
        for index in 0...100{
            array.append(index)
        }
        return array
    }


}

extension NumbersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NumbersTableViewCell.getCellIdentifier()) as! NumbersTableViewCell
        
        let number = array[indexPath.row]
        cell.numberLabel.text = "\(number)"
        
        if (number % 2 == 0)
        {
        cell.backgroundColor = UIColor.red
        }
        else
        {
        cell.backgroundColor = UIColor.blue
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
