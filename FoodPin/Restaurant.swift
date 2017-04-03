//
//  Restaurant.swift
//  FoodPin
//
//  Created by Sean Perez on 4/1/17.
//  Copyright © 2017 SeanPerez. All rights reserved.
//

import Foundation

class Restaurant {
    var name = ""
    var type = ""
    var location = ""
    var phoneNumber = ""
    var image = ""
    var isVisited = false
    var rating: String?
    
    init(name: String, type: String, location: String, phoneNumber: String, image: String, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phoneNumber = phoneNumber
        self.image = image
        self.isVisited = isVisited
    }
}
