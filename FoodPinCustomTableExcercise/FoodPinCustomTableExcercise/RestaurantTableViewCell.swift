//
//  TableViewCell.swift
//  FoodPinCustomTableExcercise
//
//  Created by Ananchai Mankhong on 12/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var localtionName: UILabel!
    @IBOutlet weak var typeName: UILabel!
    @IBOutlet weak var thumbnailNmae: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
