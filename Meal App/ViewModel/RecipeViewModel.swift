//
//  RecipeViewModel.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/15/21.
//

import Foundation

class RecipeViewModel {
    
    private var apiService = ApiService()
    private var mealDetails = [Recipe]()
    
    //MARK: Fetch Data from API
    func getRecipeFromMealData(id:String, completion: @escaping () -> ()) {
        
        apiService.getMealDetails(id:id) { [weak self] (result) in
            switch result {
            case .success(let dataOf):
                self?.mealDetails = dataOf.recipe
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    
    func getRecipe() -> Recipe {
        
        return mealDetails[mealDetails.startIndex]
    }
}
