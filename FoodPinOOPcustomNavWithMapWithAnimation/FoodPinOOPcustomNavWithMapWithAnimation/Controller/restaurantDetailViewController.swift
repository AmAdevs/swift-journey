//
//  restaurantDetailViewController.swift
//  FoodPinNavigation
//
//  Created by Ananchai Mankhong on 14/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class restaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }

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
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.separatorStyle = .none
        
        
        // Custom NavigationBar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
       
        
        tableView.contentInsetAdjustmentBehavior = .never
        navigationController?.hidesBarsOnSwipe = false
        
    
   
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
                cell.iconImageView.image = UIImage(named: "phone")
                cell.shortTextLabel.text = restaurant.phone
                cell.selectionStyle = .none
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
                cell.iconImageView.image = UIImage(named: "map")
                cell.shortTextLabel.text = restaurant.location
                cell.selectionStyle = .none
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
                cell.descriptionLabel.text = restaurant.description
                cell.selectionStyle = .none
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
                cell.titleLabel.text = "HOW TO GET HERE"
                cell.selectionStyle = .none
                
                return cell
            
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
               
                cell.selectionStyle = .none
                cell.configure(location: restaurant.location)
            return cell
            
            default:
                fatalError("Failed to instantiate the table view cell for detail view count roller")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            destinationController.restaurant = restaurant
        }
    }
    

 

}
