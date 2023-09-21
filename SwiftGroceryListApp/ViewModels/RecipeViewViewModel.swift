//
//  RecipeViewViewModel.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 20/09/2023.
//

import FirebaseFirestore
import Foundation

class RecipeViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete Grocery List Item
    /// - Parameter id: Item Id to delete
    ///
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("grocery")
            .document(id)
            .delete()
        // we don't need call back because Firestore Query in View is listening to live updates
    }
    
    func retrieveDistinctCategory(items: [GroceryListItem]) -> [String] {
        return Array(Set(
            (items).compactMap{$0.category}))
    }
}
