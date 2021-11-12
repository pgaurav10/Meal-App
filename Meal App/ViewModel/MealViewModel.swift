//
//  MealViewModel.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/12/21.
//

import Foundation

class MealViewModel {
    
    private var apiService = ApiService()
    private var foodTypes = [Category]()
    
    func getFoodCategoriesData(completion: @escaping () -> ()) {
        
        apiService.getFoodTypes { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.foodTypes = listOf.categories
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if foodTypes.count != 0 {
            return foodTypes.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Category {
        return foodTypes[indexPath.row]
    }
}
