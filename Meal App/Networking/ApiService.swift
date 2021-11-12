//
//  ApiService.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/10/21.
//

import Foundation

class ApiService {
    
    private var dataTask: URLSessionDataTask?
    
    func getFoodTypes(completion: @escaping (Result<Categories,Error>) -> Void) {
        
        let foodTypes = "https://www.themealdb.com/api/json/v1/1/categories.php"
        
        guard let url = URL(string: foodTypes) else {return}
        
        //URL session work in background
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handle Error
            
            if let error = error {
                completion(.failure(error))
                print("Data Task error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                //Empty Response
                print("Empty response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                //Empty Data
                print("Empty Data")
                return
            }
            
            do {
                //Parse data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Categories.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
