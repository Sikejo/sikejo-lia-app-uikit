//
//  ListTableViewModel.swift
//  lia-app-uikit
//
//  Created by Filip Henriksson on 2024-05-14.
//

import Foundation

class ListTableViewModel {
    
    var items: [ListItem] = []
    
    func loadDogBreeds() async {
        guard let breeds = await APIManager.shared.fetchDogBreeds() else {
            print("Failed to load dog breeds")
            return
        }
                
        for breed in breeds {
            items.append(ListItem(breed: breed))
        }
    }
    
    func isFavorite(for index: Int) -> Bool {
        // Check if the breed is a favorite based on the list of favorite breeds in UserDefaults
        guard let favoriteBreeds = UserDefaults.standard.stringArray(forKey: "favoriteBreeds") else {
            return false
        }
        return favoriteBreeds.contains(items[index].breed.name)
    }
    
    func toggleFavorite(for index: Int) {
        var favoriteBreeds = UserDefaults.standard.stringArray(forKey: "favoriteBreeds") ?? []

        if let index = favoriteBreeds.firstIndex(of: items[index].breed.name) {
            favoriteBreeds.remove(at: index)
        } else {
            favoriteBreeds.append(items[index].breed.name)
        }

        UserDefaults.standard.set(favoriteBreeds, forKey: "favoriteBreeds")
    }
}
