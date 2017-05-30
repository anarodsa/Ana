//
//  CatTableViewCell.swift
//  Quiz 4
//
//  Created by Gilberto Luna on 30/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class CatTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(cats: Cat){
        
        nameLabel.text = cats.name
    }
}
