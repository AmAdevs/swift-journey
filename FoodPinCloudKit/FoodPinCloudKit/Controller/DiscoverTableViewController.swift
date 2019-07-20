//
//  DiscoverTableViewController.swift
//  FoodPinCloudKit
//
//  Created by Ananchai Mankhong on 20/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit
import CloudKit

class DiscoverTableViewController: UITableViewController {

    
    var restaurants: [CKRecord] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Configure navigation appearance
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        if let customFont = UIFont(name: "Rubik-Medium", size: 44.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: UIColor(red: 231, green: 76, blue: 60)]
        }
        
        fecthRecordsFromCloud()

    }
    
    func fecthRecordsFromCloud() {
        
        // Fetch data using Convenience API
        let cloudContrainer = CKContainer.default()
        let publicDatabase = cloudContrainer.publicCloudDatabase
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        publicDatabase.perform(query, inZoneWith: nil, completionHandler: {
            (results, error) -> Void in
            
            if let error = error {
                print(error)
                return
            }
            
            if let results = results {
                print("Completed the download of Restaurant data")
                self.restaurants = results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            
                
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverCell", for: indexPath)
        
        // Configure Cell
        let restaurant = restaurants[indexPath.row]
        cell.textLabel?.text = restaurant.object(forKey: "Name") as? String
        
        if let image = restaurant.object(forKey: "image"), let imageAsset = image as? CKAsset {
            if let imageData = try? Data.init(contentsOf: imageAsset.fileURL!) {
                cell.imageView?.image = UIImage(data: imageData)
            }
        }
        return cell
    }



}
