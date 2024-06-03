//
//  APIManager.swift
//  lia-app-uikit
//
//  Created by Alice Wheeler on 2024-05-06.
//

import Foundation
import UIKit

class APIManager {
    
    // Create a shared instance of APIManager to be used across the app
    static let shared = APIManager()
    
    // Define the base URL for fetching dog breeds
    let baseURL = "https://api.thedogapi.com/v1/breeds?limit=1000&page=0"
    let infoURL = "https://api.thedogapi.com/v1/breeds/:breed_id"
    
    // Define an asynchronous function to fetch dog breeds from the API
    let apiKey = Constants.API_KEY
    
    func fetchDogs() async -> [Dog]? {
        // Concatenate the API key to the base URL for authentication
        let urlWithKey = "\(APIManager.shared.baseURL)?api_key=\(APIManager.shared.apiKey)"
        // Convert the string URL into a URL object. If this fails, return nil.
        
        guard let url = URL(string: urlWithKey) else {
            return nil
        }
        do {
            // Attempt to get the data from the API using URLSession
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode the JSON data into an array of Dog objects
            let breeds = try JSONDecoder().decode([Dog].self, from: data)
            
            return breeds
        } catch {
            // If an error occurs during fetching or decoding, print the error and return nil
            print(error.localizedDescription)
            return nil
        }
    }
    
    func fetchImage(with referenceImageID: String, completion: @escaping (UIImage?) -> Void) {
            let infoUrlString = "https://api.thedogapi.com/v1/images/\(referenceImageID)"
            guard let infoUrl = URL(string: infoUrlString) else {
                completion(nil)
                return
            }
            
            URLSession.shared.dataTask(with: infoUrl) { data, response, error in
                guard let data = data, error == nil else {
                    print("Error fetching image info: \(error?.localizedDescription ?? "Unknown error")")
                    completion(nil)
                    return
                }
                
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                          let imageUrlString = json["url"] as? String,
                          let imageUrl = URL(string: imageUrlString) else {
                        completion(nil)
                        return
                    }
                    
                    URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                        guard let data = data, error == nil else {
                            print("Error fetching image: \(error?.localizedDescription ?? "Unknown error")")
                            completion(nil)
                            return
                        }
                        let image = UIImage(data: data)
                        completion(image)
                    }.resume()
                    
                } catch {
                    print("Error parsing JSON: \(error.localizedDescription)")
                    completion(nil)
                }
            }.resume()
        }
    }
