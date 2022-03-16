//
//  Items.swift
//  Swap
//
//  Created by Daniel Belokursky on 16.03.22.
//

import UIKit

struct Item: Hashable {
    var name: String
    var location: String
    var image: String
    
    init(name: String, location: String, image: String) {
        self.name = name
        self.location = location
        self.image = image
    }
}
