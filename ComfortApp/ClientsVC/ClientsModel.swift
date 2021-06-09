//
//  ClientsModel.swift
//  Unicorn-Tour
//
//  Created by Ekaterina Borobaenko on 05.05.2021.
//

import Foundation

struct Client: Codable {
    var name: String
    var adress: String?
    var phone: String
    var realtyType: String?
    var dealType: String
}

