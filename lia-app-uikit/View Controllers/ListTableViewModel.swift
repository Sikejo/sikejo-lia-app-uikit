//
//  ListTableViewModel.swift
//  lia-app-uikit
//
//  Created by Filip Henriksson on 2024-05-14.
//

import Foundation

class ListTableViewModel {
    var items: [Dog] = []
    
    func loadDogs() async {
        guard let dogs = await APIManager.shared.fetchDogs() else {
            return
        }
                
        for dog in dogs {
            items.append(dog)
        }
    }
    
    func isFavorite(for index: Int) -> Bool {
        return Database.isInDatabase(items[index])
    }
    
    func toggleFavorite(for index: Int) {
        let dog = items[index]
        if Database.isInDatabase(dog) {
            Database.removeFromDatabase(dog)
        } else {
            Database.addToDatabase(dog)
        }
    }
}
