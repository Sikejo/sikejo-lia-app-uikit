//
//  APIManager.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-06.
//

import Foundation

class APIManager {
    
    // Create a shared instance of APIManager to be used across the app
    static let shared = APIManager()
    
    // Define the base URL for fetching dog breeds
    let baseURL = "https://api.thedogapi.com/v1/breeds?limit=1000&page=0"
    let infoURL = "https://api.thedogapi.com/v1/breeds/:breed_id"
    let imageURL = "https://api.thedogapi.com/v1/images/:image_id?sub_id&include_vote=&include_favourite"
    
    // Define an asynchronous function to fetch dog breeds from the API
    let apiKey = Constants.API_KEY
    
    func fetchDogBreeds() async -> [Breed]? {
        // Concatenate the API key to the base URL for authentication
        let urlWithKey = "\(APIManager.shared.baseURL)?api_key=\(APIManager.shared.apiKey)"
        // Convert the string URL into a URL object. If this fails, return nil.
        
        guard let url = URL(string: urlWithKey) else {
            return nil
        }
        do {
            // Attempt to get the data from the API using URLSession
            let (data, status) = try await URLSession.shared.data(from: url)
            
            // Decode the JSON data into an array of Breed objects
            let breeds = try JSONDecoder().decode([Breed].self, from: data)
            
            return breeds
        } catch {
            // If an error occurs during fetching or decoding, print the error and return nil
            print(error.localizedDescription)
            return nil
        }
    }
}
