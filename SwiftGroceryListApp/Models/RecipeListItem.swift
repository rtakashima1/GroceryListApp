//
//  RecipeListItem.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 20/09/2023.
//

import Foundation

struct RecipeListItem: Codable,Hashable, Identifiable {
    let id: String
    let title: String
    let category: String
    let ingredients: [GroceryListItem]
    let ingredientsList: String
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
}
