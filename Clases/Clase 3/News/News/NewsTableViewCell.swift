//
//  NewsTableViewCell.swift
//  News
//
//  Created by Gilberto Luna on 18/5/17.
//  Copyright © 2017 Ana Rodriguez. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titlLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        func setupCell(news: News){
            titlLabel.text = news.titleNews
            descriptionLabel.text = news.descriptionNews
//            dateLabel.text = news.createdAt
        }
    }
    
}
