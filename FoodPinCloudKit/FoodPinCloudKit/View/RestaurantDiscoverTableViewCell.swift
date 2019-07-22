//
//  RestaurantDiscoverTableViewCell.swift
//  FoodPinCloudKit
//
//  Created by Ananchai Mankhong on 22/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class RestaurantDiscoverTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageRestaurant: UIImageView! {
        didSet {
            imageRestaurant.contentMode = .scaleAspectFill
            imageRestaurant.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var typeLabel: UILabel! {
        didSet {
            typeLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var locationLabel: UILabel! {
        didSet {
            locationLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
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
