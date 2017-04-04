//
//  AddRestaurantController.swift
//  FoodPin
//
//  Created by Sean Perez on 4/3/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController {

    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    var haveYouBeenThere = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        if let name = nameTextField.text, name != "", let type = typeTextField.text, type != "", let location = locationTextField.text, location != "" {
            let restaurant = Restaurant(name: name, type: type, location: location, phoneNumber: "345-576-8475", image: "restaurant.jpg", isVisited: haveYouBeenThere)
            print(restaurant)
            performSegue(withIdentifier: "unwindToHomeScreen", sender: self)
        } else {
            let alert = UIAlertController(title: "Missing Fields", message: "Please enter all fields to save a restaurant", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func haveYouBeenThere(sender: UIButton) {
        if sender == yesButton {
            haveYouBeenThere = true
            yesButton.backgroundColor = UIColor(red: 255/255, green: 36/255, blue: 60/255, alpha: 1.0)
            noButton.backgroundColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0)
        } else if sender == noButton {
            haveYouBeenThere = false
            noButton.backgroundColor = UIColor(red: 255/255, green: 36/255, blue: 60/255, alpha: 1.0)
            yesButton.backgroundColor = UIColor(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 4 {
            return nil
        } else {
            return indexPath
        }
    }

}

extension AddRestaurantController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        restaurantImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        restaurantImage.contentMode = .scaleAspectFill
        restaurantImage.clipsToBounds = true
        let leadingContraint = NSLayoutConstraint(item: restaurantImage, attribute: .leading, relatedBy: .equal, toItem: restaurantImage.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingContraint.isActive = true
        let trailingContraint = NSLayoutConstraint(item: restaurantImage, attribute: .trailing, relatedBy: .equal, toItem: restaurantImage.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingContraint.isActive = true
        let topConstraint = NSLayoutConstraint(item: restaurantImage, attribute: .top, relatedBy: .equal, toItem: restaurantImage.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        let bottomContraint = NSLayoutConstraint(item: restaurantImage, attribute: .bottom, relatedBy: .equal, toItem: restaurantImage.superview, attribute: .bottom, multiplier: 1, constant: 0)
        bottomContraint.isActive = true
        dismiss(animated: true, completion: nil)
    }
}
