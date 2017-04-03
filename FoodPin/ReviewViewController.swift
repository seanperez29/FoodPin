//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Sean Perez on 4/2/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit
import Foundation

class ReviewViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var ratingsStackView: UIStackView!
    var rating: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImage.addSubview(blurEffectView)
        let translation = CGAffineTransform(translationX: 0, y: view.bounds.maxY)
        let scale = CGAffineTransform(scaleX: 0, y: 0)
        ratingsStackView.transform = scale.concatenating(translation)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
            self.ratingsStackView.transform = .identity
        }, completion: nil)
    }

    @IBAction func ratingSelected(sender: UIButton) {
        switch (sender.tag) {
        case 100: rating = "dislike"
        case 200: rating = "good"
        case 300: rating = "great"
        default: break
        }
        performSegue(withIdentifier: "unwindToDetailView", sender: sender)
    }

}
