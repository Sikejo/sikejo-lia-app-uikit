//
//  FavouriteViewModel.swift
//  lia-app-uikit
//
//  Created by Filip Henriksson on 2024-05-15.
//

import Foundation

class FavouriteViewModel {
    
    var items: [String] = UserDefaults.standard.stringArray(forKey: "favoriteBreeds") ?? []
    
    func removeItem(at index: Int) {
        var favoriteBreeds = UserDefaults.standard.stringArray(forKey: "favoriteBreeds") ?? []

        if let index = favoriteBreeds.firstIndex(of: items[index]) {
            favoriteBreeds.remove(at: index)
        } else {
            favoriteBreeds.append(items[index])
        }

        UserDefaults.standard.set(favoriteBreeds, forKey: "favoriteBreeds")
        
        items.remove(at: index)
    }
    
    
}
