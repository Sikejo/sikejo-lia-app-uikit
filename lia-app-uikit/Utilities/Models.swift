//
//  Models.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-06.
//

import Foundation

struct Breed: Codable {
    let id: Int
    let name: String
}

struct Response: Codable {
    let breeds: [Breed]
}

struct ListItem: Equatable {
    static func == (lhs: ListItem, rhs: ListItem) -> Bool {
        return lhs.breed.name == rhs.breed.name
    }
    
    var breed: Breed
}
