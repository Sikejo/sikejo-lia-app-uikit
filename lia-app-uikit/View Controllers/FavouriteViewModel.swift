//
//  FavouriteViewModel.swift
//  lia-app-uikit
//
//  Created by Filip Henriksson on 2024-05-15.
//

import Foundation

class FavouriteViewModel {
    var items: [Dog] = Database.fetchFromDatabase()
    
    func remove(_ dog: Dog) {
        Database.removeFromDatabase(dog)
        items.removeAll { item in
            item.id == dog.id
        }
    }
}
