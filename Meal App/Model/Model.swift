//
//  Model.swift
//  Meal App
//
//  Created by Gaurav Patil on 11/10/21.
//

import Foundation

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
