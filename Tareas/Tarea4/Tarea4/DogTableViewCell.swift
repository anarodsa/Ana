//
//  DogTableViewCell.swift
//  Tarea4
//
//  Created by Gilberto Luna on 6/6/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {

    @IBOutlet weak var imageImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var colorLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupCell(dog: Dog)
    {
        nameLabel.text = dog.name
        colorLabel.text = dog.color
        
        let image : UIImage = UIImage(data: dog.image as! Data)!
        imageImageView.image = image
    }
    
    
}
