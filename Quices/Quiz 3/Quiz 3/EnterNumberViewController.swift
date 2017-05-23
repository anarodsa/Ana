//
//  EnterNumberViewController.swift
//  Quiz 3
//
//  Created by Gilberto Luna on 23/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class EnterNumberViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtDato: UITextField!
    
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCustomCell(identifier: NumberCustomCell.getCellIdentifier())

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnIngresaDato(_ sender: Any) {
        
        array.append(txtDato.text!)
        tableView.reloadData()
    }
   

}

extension EnterNumberViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NumberCustomCell.getCellIdentifier()) as! NumberCustomCell
        
        let dato = array[indexPath.row]
        cell.lblDato.text = "\(dato)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
