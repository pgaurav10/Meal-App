//
//  CategoryViewModel.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/14/21.
//

import Foundation

class CategoryViewModel {
    
    private var apiService = ApiService()
    private var mealTypes = [Meal]()
    
    func getMealsForCategoryData(category:String, completion: @escaping () -> ()) {
        
        apiService.getMealTypes(category: category) { [weak self] (result) in
            switch result {
            case .success(let listOf):
                self?.mealTypes = listOf.meals
                self?.mealTypes.sort {$0.str ?? "" < $1.str ?? ""}
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    func numberOfRowsInSection(section: Int) -> Int {
        if mealTypes.count != 0 {
            return mealTypes.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Meal {
        return mealTypes[indexPath.row]
    }
}
