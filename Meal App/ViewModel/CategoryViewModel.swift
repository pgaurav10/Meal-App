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
    private var filteredMealTypes = [Meal]()
    
    //MARK: Fetch Data from API
    func getMealsForCategoryData(category:String, completion: @escaping () -> ()) {
        
        apiService.getMealTypes(category: category) { [weak self] (result) in
            switch result {
            case .success(let listOf):
                self?.mealTypes = listOf.meals
                self?.mealTypes.sort {$0.str ?? "" < $1.str ?? ""}
                self?.filteredMealTypes = listOf.meals
                self?.filteredMealTypes.sort {$0.str ?? "" < $1.str ?? ""}
                completion()
            case .failure(let error):
                print("Error processing json data: \(error)")
            }
        }
    }
    func numberOfRowsInSection(section: Int) -> Int {
        if filteredMealTypes.count != 0 {
            return filteredMealTypes.count
        }
        return 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Meal {
        return filteredMealTypes[indexPath.row]
    }
    
    func searchForText(text: String) {
        filteredMealTypes = []
        
        if(text == "") {
            filteredMealTypes = mealTypes
        }
        else {
            for mealType in mealTypes {
                let str = mealType.str!
                if((str.lowercased().contains(text.lowercased()))) {
                    filteredMealTypes.append(mealType)
                }
            }
        }
    }
}
