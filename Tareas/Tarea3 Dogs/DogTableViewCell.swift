//
//  DogTableViewCell.swift
//  Tarea3 Dogs
//
//  Created by Gilberto Luna on 30/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit
import RealmSwift

class DogTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageImageV: UIImageView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    func setupCell(dogs: Dogs){
        
        imageImageV.image = UIImage(named: dogs.image)
        nameLabel.text = dogs.name
        colorLabel.text = dogs.color
    }
}
