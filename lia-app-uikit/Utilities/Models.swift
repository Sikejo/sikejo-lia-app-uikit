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
