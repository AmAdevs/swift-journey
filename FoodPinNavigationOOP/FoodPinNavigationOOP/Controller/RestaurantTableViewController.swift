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
    
    var restaurants: [Restaurant] =  [
        
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
        Restaurant(name: "Cafe Loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
        Restaurant(name: "or Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
        Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Hong Kong", image: "bourkestreetbakery", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "Sydney", image: "upstate", isVisited: false),
        Restaurant(name: "Traif", type: "reakfast & Brunch", location: "New York", image: "traif", isVisited: false),
        Restaurant(name: "Graham Avenue Meats And Deli", type: "", location: "New York", image: "grahamavenuemeats", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "New York", image: "barrafina", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isVisited: false)
    ]
//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
//
//    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
//
//    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York" , "New York" , "London", "London", "London"]
//
//    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.showsVerticalScrollIndicator = false
        tableView.cellLayoutMarginsFollowReadableWidth = true   //set screen ipad NORMAL tableCell
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.locationType.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        
        //cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        cell.heartImageView.isHidden = restaurants[indexPath.row].isVisited ? false : true
    
        
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let optionMenu = UIAlertController(title: "What's up", message: "What do you want to do?", preferredStyle: UIAlertController.Style.actionSheet)
//
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//
//        optionMenu.addAction(cancelAction)
//
//
//        // call function
//        let callActionHandler = { (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry laetr.", preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//            self.present(alertMessage, animated: true, completion: nil)
//
//        }
//
//        let callAction = UIAlertAction(title: "Call" + " 123-00-\(indexPath.row)", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//
//
//        let checkInActionTitle = restaurantIsVisited[indexPath.row] ? "undo check in" : "check in"
//
//        // Check-in action
//        let checkInAction = UIAlertAction(title: checkInActionTitle, style: .default) { (action: UIAlertAction!) in
//
//            // for Standard of iPhone
////            let cell = tableView.cellForRow(at: indexPath)
////            cell?.accessoryType = .checkmark
////            self.restaurantIsVisited[indexPath.row] = true
//            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
//
//
//            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//
//            cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
//
//            print("image isHidden",  self.restaurantIsVisited[indexPath.row])
//
//
//
//        }
//
//        optionMenu.addAction(checkInAction)
//
//
//        present(optionMenu, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: false)
//
//        // popover of iPad
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath) {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//
//
//    }
//
//
////    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
////
////        if editingStyle == .delete {
////            // Delete the row from the data source
////            restaurantNames.remove(at: indexPath.row)
////            restaurantLocations.remove(at: indexPath.row)
////            restaurantTypes.remove(at: indexPath.row)
////            restaurantIsVisited.remove(at: indexPath.row)
////            restaurantImages.remove(at: indexPath.row)
////
////
////        }
////
////        //tableView.reloadData()
////        tableView.deleteRows(at: [indexPath], with: .fade)
////
////
////        print("Total item: \(restaurantNames.count)")
////        for name in restaurantNames {
////            print(name)
////        }
////
////    }
//
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (UIContextualAction, UIView, completionHandler) in

            // Delete the row from the data source
            self.restaurants.remove(at: indexPath.row)
//            self.restaurantNames.remove(at: indexPath.row)
//            self.restaurantLocations.remove(at: indexPath.row)
//            self.restaurantTypes.remove(at: indexPath.row)
//            self.restaurantIsVisited.remove(at: indexPath.row)
//            self.restaurantImages.remove(at: indexPath.row)

            self.tableView.deleteRows(at: [indexPath], with: .fade)

            completionHandler(true)
        }

        let shareAction = UIContextualAction(style: .normal, title: "Share") { (UIContextualAction, UIView, completionHandler) in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
//            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            let activityController: UIActivityViewController

            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }

            // set popOver to when use iPad
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }


            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }

        deleteAction.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1)
        deleteAction.image = UIImage(named: "delete")

        shareAction.backgroundColor = UIColor(red: 254/255, green: 149/255, blue: 38/255, alpha: 1)
        shareAction.image = UIImage(named: "share")

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])

        return swipeConfiguration

    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkInAction = UIContextualAction(style: .normal, title: "Check-in") { (UIContextualAction, UIView, CompletionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
            
            
            
            
            CompletionHandler(true)
        }
        
        let checkInIcon = restaurantIsVisited[indexPath.row] ? "undo" : "tick"
        checkInAction.backgroundColor = UIColor(red: 38/255, green: 162/255, blue: 78/255, alpha: 1)
        checkInAction.image = UIImage(named: checkInIcon)
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        
        return swipeConfiguration
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "restaurantShowDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! restaurantDetailViewController
                    destinationController.restaurant = restaurants[indexPath.row]
                
            }
        }
    }
    
    
    
}
