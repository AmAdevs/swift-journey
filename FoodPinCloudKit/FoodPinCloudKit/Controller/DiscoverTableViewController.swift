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
    var spinner = UIActivityIndicatorView()
    
    private var imageCache = NSCache<CKRecord.ID, NSURL>()
    
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
        
     
        
        spinner.style = .gray
        spinner.hidesWhenStopped = true
        view.addSubview(spinner)
        
        // Define layout constraints for the spinner
        spinner.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([spinner.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),     spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
        
        // Activate the spinner
        spinner.startAnimating()
        
        
        
        // Pull To Refresh Control
        refreshControl =  UIRefreshControl()
        refreshControl?.backgroundColor = UIColor.white
        refreshControl?.tintColor = UIColor.red
        refreshControl?.addTarget(self, action: #selector(fecthRecordsFromCloud), for: UIControl.Event.valueChanged)
        
        
        
        
        fecthRecordsFromCloud()

    }
    
    @objc func fecthRecordsFromCloud() {
        
        // Remove existing records before refreshing
        restaurants.removeAll()
        tableView.reloadData()
        
  
        
        // Fetch data using Convenience API
        let cloudContrainer = CKContainer.default()
        let publicDatabase = cloudContrainer.publicCloudDatabase
        // Prepare the query
        let predicate = NSPredicate(value: true)
        let query = CKQuery(recordType: "Restaurant", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
      
        // Create the query operation with the query
        let queryOperation = CKQueryOperation(query: query)
        queryOperation.desiredKeys = ["Name", "type", "location", "phone", "description"]
        queryOperation.queuePriority = .veryHigh
        queryOperation.resultsLimit = 50
        queryOperation.recordFetchedBlock = { (record) -> Void in
            self.restaurants.append(record)
        }
        
        queryOperation.queryCompletionBlock = { [unowned self] (cursor, error) -> Void in
            if let error = error {
                print("Feiled to get data from icloud - \(error.localizedDescription)")
                return
            }
            
            print("Successfullly retrieve the data from iCloud")
            DispatchQueue.main.async {
                self.spinner.stopAnimating()
                self.tableView.reloadData()
                if let refreshControl = self.refreshControl {
                    if refreshControl.isRefreshing {
                        refreshControl.endRefreshing()
                    }
                }
            }
        }
        
        // Execute the query
        publicDatabase.add(queryOperation)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverCell", for: indexPath) as! RestaurantDiscoverTableViewCell
        
        // Configure Cell
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel?.text = restaurant.object(forKey: "Name") as? String
        cell.typeLabel?.text = restaurant.object(forKey: "type") as? String
        cell.locationLabel?.text = restaurant.object(forKey: "location") as? String
        cell.phoneLabel?.text = restaurant.object(forKey: "phone") as? String
        cell.descriptionLabel?.text = restaurant.object(forKey: "description") as? String
    
        
        // Set the default image
        cell.imageRestaurant?.image = UIImage(named: "photo")
        
        // Check if the image is stored in cache
        if let imageFileURL = imageCache.object(forKey: restaurant.recordID) {
            // Fetch image from cache
            print("Get image from cache")
            if let imageData = try? Data.init(contentsOf: imageFileURL as URL) {
                cell.imageRestaurant?.image = UIImage(data: imageData)
            }
        }
        
        
        
        // Fetch Image from Cloud in background
        let publicDatabase = CKContainer.default().publicCloudDatabase
        let fetchRecordsImageOperation = CKFetchRecordsOperation(recordIDs: [restaurant.recordID])
        fetchRecordsImageOperation.desiredKeys = ["image"]
        fetchRecordsImageOperation.queuePriority = .veryHigh
        
        fetchRecordsImageOperation.perRecordCompletionBlock = { [unowned self] (record, recordID, error) -> Void in
            if let error = error {
                print("Failed to get restaurant image: \(error.localizedDescription)")
                return
            }
            
            if let restaurantRecord = record,
                let image = restaurantRecord.object(forKey: "image"),
                let imageAsset = image as? CKAsset {
                    
                if let imageData = try? Data.init(contentsOf: imageAsset.fileURL!) {
                    
                    // Replace the placeholder image with the restaurant image
                    DispatchQueue.main.async {
                        cell.imageRestaurant?.image = UIImage(data: imageData)
                        cell.setNeedsLayout()
                    }
                    
                    // Add the image URL to cache
                    self.imageCache.setObject(imageAsset.fileURL! as NSURL, forKey: restaurant.recordID)
                }
                
            }
        }
        
        publicDatabase.add(fetchRecordsImageOperation)
    
        return cell
    }



}
