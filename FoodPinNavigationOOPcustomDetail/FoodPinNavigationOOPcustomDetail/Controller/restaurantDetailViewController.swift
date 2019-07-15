//
//  restaurantDetailViewController.swift
//  FoodPinNavigation
//
//  Created by Ananchai Mankhong on 14/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class restaurantDetailViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: RestaurantDetailHeaderView!
    
//    var restaurantImageName = ""
//    var restaurantNameText = ""
//    var restaurantTypeText = ""
//    var restaurantLocationText = ""
    var restaurant = Restaurant()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never

        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.heartImageView.isHidden = (restaurant.isVisited) ? false : true
        
        
        
    }
    

 

}
