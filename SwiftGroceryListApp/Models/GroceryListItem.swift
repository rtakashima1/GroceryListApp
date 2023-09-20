//
//  GroceryListItem.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import Foundation

struct GroceryListItem: Codable,Hashable, Identifiable {
    let id: String
    let title: String
    let category: String
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
