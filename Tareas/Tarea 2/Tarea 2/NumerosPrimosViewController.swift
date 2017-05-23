//
//  NumerosPrimosViewController.swift
//  Tarea 2
//
//  Created by Gilberto Luna on 19/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class NumerosPrimosViewController: UIViewController {

    var array = [Int]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = RetornaArray ()
        tableView.registerCustomCell(identifier: NumerosPrimosTableViewCell.getCellIdentifier())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func RetornaArray () -> [Int]
    {
        var primo = [Int]()
        var noprimo = [Int]()
        for index in 0...1000
        {
            if(esPrimo(num: index))
            {
                primo.append(index)
            }
            else
            {
                noprimo.append(index)
            }
        }
        return primo
    }
    
    func esPrimo(num: Int) -> Bool
    {
        var div = 2;
        
        while (div < num)
        {
            //Si el residuo es cero entonses no es primo
            if  ((num % div) == 0)
            {
                return false
            }
            div += 1
        }
        //Retornamos el valor 
        
        return true;
    
    }

}

extension NumerosPrimosViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NumerosPrimosTableViewCell.getCellIdentifier()) as! NumerosPrimosTableViewCell
        
        let number = array[indexPath.row]
        cell.numberLabel.text = "\(number)"
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
