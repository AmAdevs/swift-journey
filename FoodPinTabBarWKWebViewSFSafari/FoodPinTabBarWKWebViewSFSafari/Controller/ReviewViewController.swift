//
//  ReviewViewController.swift
//  FoodPinOOPcustomNavWithMapWithAnimation
//
//  Created by Ananchai Mankhong on 17/7/2562 BE.
//  Copyright © 2562 Ananchai Mankhong. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    @IBOutlet var closeButton: UIButton!
    
    var restaurant: RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let restaurantImage = restaurant.image {
            backgroundImageView.image = UIImage(data: restaurantImage as Data)
        }

        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0) // Negative is fade animation Left to end state
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        // Make the button invisible
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        let moveTopTransform = CGAffineTransform.init(translationX: 0, y: -800)
        closeButton.transform = moveTopTransform
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
   
        for i in 0...4 {
            UIView.animate(withDuration: 0.4, delay: (0.1 + 0.05 ) * Double(i) , options: [], animations: {
                self.rateButtons[i].alpha = 1.0
                self.rateButtons[i].transform = .identity
            }, completion: nil)
        }
        
        UIView.animate(withDuration: 0.4) {
            self.closeButton.transform = .identity
        }
      
        
        
    }


}
