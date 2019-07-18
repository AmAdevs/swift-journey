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
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.image)

        // Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // Make the button invisible
        for rateButton in rateButtons {
            rateButton.alpha = 0
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0) {
            self.rateButtons[0].alpha = 1.0
            self.rateButtons[1].alpha = 1.0
            self.rateButtons[2].alpha = 1.0
            self.rateButtons[3].alpha = 1.0
            self.rateButtons[4].alpha = 1.0

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
