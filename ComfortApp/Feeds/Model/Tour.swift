//
//  Feed.swift
//  Team_UP
//
//  Created by Ekaterina Borobaenko on 05.05.2021.
//

import Foundation

struct Tour: Codable {
    
    var image: String
    var name: String
    var description: String
    var country: String
    var stars: Int
    var price: Int
    var numberOfComments: Int
}
