//
//  Models.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-06.
//

import Foundation

struct Dog: Codable {
    let weight: Measurement?
    let height: Measurement?
    let id: Int
    let name: String
    let bredFor: String?
    let breedGroup: String?
    let lifeSpan: String?
    let temperament: String?
    let origin: String?
    let countryCode: String?
    let description: String?
    let history: String?
    let referenceImageID: String?
    
    enum CodingKeys: String, CodingKey {
        case weight, height, id, name
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament, origin
        case countryCode = "country_code"
        case description, history
        case referenceImageID = "reference_image_id"
    }
}

// MARK: - Measurement
struct Measurement: Codable {
    let imperial: String
    let metric: String
}

struct Response: Codable {
    let dogs: [Dog]
}
