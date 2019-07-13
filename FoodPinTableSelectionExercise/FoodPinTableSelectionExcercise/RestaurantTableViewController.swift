//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Ananchai Mankhong on 12/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit


class RestaurantTableViewController: UITableViewController {
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    var cellId = "cell"
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York" , "New York" , "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.showsVerticalScrollIndicator = false
        tableView.cellLayoutMarginsFollowReadableWidth = true   //set screen ipad NORMAL tableCell
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationType.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        //cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        cell.heartImageView.isHidden = restaurantIsVisited[indexPath.row] ? false : true
    
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: "What's up", message: "What do you want to do?", preferredStyle: UIAlertController.Style.actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        
        // call function
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry laetr.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertMessage, animated: true, completion: nil)

        }
        
        let callAction = UIAlertAction(title: "Call" + " 123-00-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        let checkInActionTitle = restaurantIsVisited[indexPath.row] ? "undo check in" : "check in"
        
        // Check-in action
        let checkInAction = UIAlertAction(title: checkInActionTitle, style: .default) { (action: UIAlertAction!) in
            
            // for Standard of iPhone
//            let cell = tableView.cellForRow(at: indexPath)
//            cell?.accessoryType = .checkmark
//            self.restaurantIsVisited[indexPath.row] = true
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            
            cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
            
            print("image isHidden",  self.restaurantIsVisited[indexPath.row])
            
            
           
        }
        
        optionMenu.addAction(checkInAction)
        
        
        present(optionMenu, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        // popover of iPad
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
    
        
        
    }
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            restaurantNames.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantIsVisited.remove(at: indexPath.row)
//            restaurantImages.remove(at: indexPath.row)
//
//
//        }
//
//        //tableView.reloadData()
//        tableView.deleteRows(at: [indexPath], with: .fade)
//
//
//        print("Total item: \(restaurantNames.count)")
//        for name in restaurantNames {
//            print(name)
//        }
//
//    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (UIContextualAction, UIView, completionHandler) in
            
            // Delete the row from the data source
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (UIContextualAction, UIView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        return swipeConfiguration
        
    }
    
    
    
}
