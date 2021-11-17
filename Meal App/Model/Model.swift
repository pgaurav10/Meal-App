//
//  Model.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/10/21.
//

import Foundation

//MARK: First Page - Categories
struct Categories : Decodable {
    let categories: [Category]
}

struct Category: Decodable {
    let id: String?
    let str: String?
    let thumb: String?
    let desc: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "idCategory"
        case str  = "strCategory"
        case thumb = "strCategoryThumb"
        case desc = "strCategoryDescription"
    }
}

//MARK: Second Page - Meals
struct Meals: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable {
    let id: String?
    let str: String?
    let thumb: String?
    
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case str  = "strMeal"
        case thumb = "strMealThumb"
    }
}

//MARK: Third Page - Recipes
struct Recipes: Decodable {
    let recipe: [Recipe]
    
    private enum CodingKeys: String, CodingKey {
        case recipe = "meals"
    }
}

struct Recipe: Decodable {
    let str: String?
    let instructions: String?
    let thumb: String?
    let youtube: String?
    
    let inr1: String?
    let inr2: String?
    let inr3: String?
    let inr4: String?
    let inr5: String?
    let inr6: String?
    let inr7: String?
    let inr8: String?
    let inr9: String?
    let inr10: String?
    let inr11: String?
    let inr12: String?
    let inr13: String?
    let inr14: String?
    let inr15: String?
    let inr16: String?
    let inr17: String?
    let inr18: String?
    let inr19: String?
    let inr20: String?
    
    let msr1: String?
    let msr2: String?
    let msr3: String?
    let msr4: String?
    let msr5: String?
    let msr6: String?
    let msr7: String?
    let msr8: String?
    let msr9: String?
    let msr10: String?
    let msr11: String?
    let msr12: String?
    let msr13: String?
    let msr14: String?
    let msr15: String?
    let msr16: String?
    let msr17: String?
    let msr18: String?
    let msr19: String?
    let msr20: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case str  = "strMeal"
        case thumb = "strMealThumb"
        case instructions = "strInstructions"
        case youtube = "strYoutube"
        
        case inr1 = "strIngredient1"
        case inr2 = "strIngredient2"
        case inr3 = "strIngredient3"
        case inr4 = "strIngredient4"
        case inr5 = "strIngredient5"
        case inr6 = "strIngredient6"
        case inr7 = "strIngredient7"
        case inr8 = "strIngredient8"
        case inr9 = "strIngredient9"
        case inr10 = "strIngredient10"
        case inr11 = "strIngredient11"
        case inr12 = "strIngredient12"
        case inr13 = "strIngredient13"
        case inr14 = "strIngredient14"
        case inr15 = "strIngredient15"
        case inr16 = "strIngredient16"
        case inr17 = "strIngredient17"
        case inr18 = "strIngredient18"
        case inr19 = "strIngredient19"
        case inr20 = "strIngredient20"
        
        case msr1 = "strMeasure1"
        case msr2 = "strMeasure2"
        case msr3 = "strMeasure3"
        case msr4 = "strMeasure4"
        case msr5 = "strMeasure5"
        case msr6 = "strMeasure6"
        case msr7 = "strMeasure7"
        case msr8 = "strMeasure8"
        case msr9 = "strMeasure9"
        case msr10 = "strMeasure10"
        case msr11 = "strMeasure11"
        case msr12 = "strMeasure12"
        case msr13 = "strMeasure13"
        case msr14 = "strMeasure14"
        case msr15 = "strMeasure15"
        case msr16 = "strMeasure16"
        case msr17 = "strMeasure17"
        case msr18 = "strMeasure18"
        case msr19 = "strMeasure19"
        case msr20 = "strMeasure20"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        str = try values.decodeIfPresent(String.self, forKey: .str) ?? ""
        instructions = try values.decodeIfPresent(String.self, forKey: .instructions) ?? ""
        thumb = try values.decodeIfPresent(String.self, forKey: .thumb) ?? ""
        let link = try values.decodeIfPresent(String.self, forKey: .youtube) ?? ""
        
        youtube = link != "" ? link : "N/A"
        
        inr1 = try values.decodeIfPresent(String.self, forKey: .inr1) ?? ""
        inr2 = try values.decodeIfPresent(String.self, forKey: .inr2) ?? ""
        inr3 = try values.decodeIfPresent(String.self, forKey: .inr3) ?? ""
        inr4 = try values.decodeIfPresent(String.self, forKey: .inr4) ?? ""
        inr5 = try values.decodeIfPresent(String.self, forKey: .inr5) ?? ""
        inr6 = try values.decodeIfPresent(String.self, forKey: .inr6) ?? ""
        inr7 = try values.decodeIfPresent(String.self, forKey: .inr7) ?? ""
        inr8 = try values.decodeIfPresent(String.self, forKey: .inr8) ?? ""
        inr9 = try values.decodeIfPresent(String.self, forKey: .inr9) ?? ""
        inr10 = try values.decodeIfPresent(String.self, forKey: .inr10) ?? ""
        inr11 = try values.decodeIfPresent(String.self, forKey: .inr11) ?? ""
        inr12 = try values.decodeIfPresent(String.self, forKey: .inr12) ?? ""
        inr13 = try values.decodeIfPresent(String.self, forKey: .inr13) ?? ""
        inr14 = try values.decodeIfPresent(String.self, forKey: .inr14) ?? ""
        inr15 = try values.decodeIfPresent(String.self, forKey: .inr15) ?? ""
        inr16 = try values.decodeIfPresent(String.self, forKey: .inr16) ?? ""
        inr17 = try values.decodeIfPresent(String.self, forKey: .inr17) ?? ""
        inr18 = try values.decodeIfPresent(String.self, forKey: .inr18) ?? ""
        inr19 = try values.decodeIfPresent(String.self, forKey: .inr19) ?? ""
        inr20 = try values.decodeIfPresent(String.self, forKey: .inr20) ?? ""
        
        msr1 = try values.decodeIfPresent(String.self, forKey: .msr1) ?? ""
        msr2 = try values.decodeIfPresent(String.self, forKey: .msr2) ?? ""
        msr3 = try values.decodeIfPresent(String.self, forKey: .msr3) ?? ""
        msr4 = try values.decodeIfPresent(String.self, forKey: .msr4) ?? ""
        msr5 = try values.decodeIfPresent(String.self, forKey: .msr5) ?? ""
        msr6 = try values.decodeIfPresent(String.self, forKey: .msr6) ?? ""
        msr7 = try values.decodeIfPresent(String.self, forKey: .msr7) ?? ""
        msr8 = try values.decodeIfPresent(String.self, forKey: .msr8) ?? ""
        msr9 = try values.decodeIfPresent(String.self, forKey: .msr9) ?? ""
        msr10 = try values.decodeIfPresent(String.self, forKey: .msr10) ?? ""
        msr11 = try values.decodeIfPresent(String.self, forKey: .msr11) ?? ""
        msr12 = try values.decodeIfPresent(String.self, forKey: .msr12) ?? ""
        msr13 = try values.decodeIfPresent(String.self, forKey: .msr13) ?? ""
        msr14 = try values.decodeIfPresent(String.self, forKey: .msr14) ?? ""
        msr15 = try values.decodeIfPresent(String.self, forKey: .msr15) ?? ""
        msr16 = try values.decodeIfPresent(String.self, forKey: .msr16) ?? ""
        msr17 = try values.decodeIfPresent(String.self, forKey: .msr17) ?? ""
        msr18 = try values.decodeIfPresent(String.self, forKey: .msr18) ?? ""
        msr19 = try values.decodeIfPresent(String.self, forKey: .msr19) ?? ""
        msr20 = try values.decodeIfPresent(String.self, forKey: .msr20) ?? ""
        
    }
}
