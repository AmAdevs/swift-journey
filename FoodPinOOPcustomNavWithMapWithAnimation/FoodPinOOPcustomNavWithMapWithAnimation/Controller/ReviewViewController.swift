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
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0) // Negative is fade animation Left to end state
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        // Make the button invisible
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 2.0) {
            
            // Bouncing animation
            
//            UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
//                self.rateButtons[0].alpha = 1.0
//                self.rateButtons[0].transform = .identity
//            }, completion: nil)

            
            
            UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
                self.rateButtons[0].alpha = 1.0
                self.rateButtons[0].transform = .identity
            }, completion: nil)
            UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {
                self.rateButtons[1].alpha = 1.0
                self.rateButtons[1].transform = .identity
            }, completion: nil)
            UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {
                self.rateButtons[2].alpha = 1.0
                self.rateButtons[2].transform = .identity
            }, completion: nil)
            UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {
                self.rateButtons[3].alpha = 1.0
                self.rateButtons[3].transform = .identity
            }, completion: nil)
            UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {
                self.rateButtons[4].alpha = 1.0
                self.rateButtons[4].transform = .identity
            }, completion: nil)

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
