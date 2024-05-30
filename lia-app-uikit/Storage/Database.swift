//
//  Database.swift
//  lia-app-uikit
//
//  Created by Kevin Henriksson (External - Magnit Global Sweden II AB) on 2024-05-29.
//

import Foundation

struct Database {

    enum Keys: String {
        case favorites
    }
    
    public static func addToDatabase(_ dog: Dog) {
        guard let favorites = UserDefaults.standard.data(forKey: Keys.favorites.rawValue), let decoded = Database.decode(favorites) else {
            guard let encoded = Database.encode([dog]) else {
                return
            }
            Database.save(encoded)
            return
        }
        
        var newFavorites = decoded
        newFavorites.append(dog)
        
        guard let encoded = Database.encode(newFavorites) else {
            return
        }
        
        Database.save(encoded)
    }
    
    public static func removeFromDatabase(_ dog: Dog) {
        guard let favorites = UserDefaults.standard.data(forKey: Keys.favorites.rawValue), let decoded = Database.decode(favorites) else {
            return
        }
        
        var newFavorites = decoded
        
        newFavorites.removeAll { $0.id == dog.id }
        
        guard let encoded = Database.encode(newFavorites) else {
            return
        }
        
        Database.save(encoded)
    }
    
    public static func fetchFromDatabase() -> [Dog] {
        guard let favorites = UserDefaults.standard.data(forKey: Keys.favorites.rawValue) else {
            return []
        }
        
        return Database.decode(favorites) ?? []
    }
    
    public static func isInDatabase(_ dog: Dog) -> Bool {
        guard let favorites = UserDefaults.standard.data(forKey: Keys.favorites.rawValue), let decoded = Database.decode(favorites) else {
            return false
        }
        
        return decoded.contains(where: { favorite in
            favorite.id == dog.id
        })
    }
    
    private static func encode<T: Encodable>(_ value: T) -> Data? {
        do {
            return try JSONEncoder().encode(value)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private static func decode(_ data: Data) -> [Dog]? {
        do {
            let decoded = try JSONDecoder().decode([Dog].self, from: data)
            return decoded
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    private static func save(_ data: Data) {
        UserDefaults.standard.set(data, forKey: Keys.favorites.rawValue)
    }
}
