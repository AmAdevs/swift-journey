//
//  restaurantDetailViewController.swift
//  FoodPinNavigation
//
//  Created by Ananchai Mankhong on 14/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class restaurantDetailViewController: UIViewController {

    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantType: UILabel!
    @IBOutlet weak var restaurantLocation: UILabel!
    
    var restaurantImageName = ""
    var restaurantNameText = ""
    var restaurantTypeText = ""
    var restaurantLocationText = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantImageView.image = UIImage(named: restaurantImageName)
        restaurantName.text = restaurantNameText
        restaurantType.text = restaurantTypeText
        restaurantLocation.text = restaurantLocationText
        navigationItem.largeTitleDisplayMode = .never
    }
    

 

}
