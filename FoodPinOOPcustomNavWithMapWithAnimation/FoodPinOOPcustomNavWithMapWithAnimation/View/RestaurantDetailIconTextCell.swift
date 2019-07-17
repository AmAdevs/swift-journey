//
//  RestaurantDetailIconTextCell.swift
//  FoodPinNavigationOOPcustomDetail
//
//  Created by Ananchai Mankhong on 15/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class RestaurantDetailIconTextCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var shortTextLabel: UILabel! {
        didSet {
            shortTextLabel.numberOfLines = 0
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
