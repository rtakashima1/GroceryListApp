//
//  IngredientsDictionaryItem.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 21/09/2023.
//

import Foundation

struct IngredientsDictionaryItem: Codable,Hashable, Identifiable {
    let id: String
    let title: String
    let category: String
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
