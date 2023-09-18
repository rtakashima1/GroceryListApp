//
//  gItemListViewViewModel.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import FirebaseFirestore
import Foundation

class GroceryListViewViewModel: ObservableObject {
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
}
 
