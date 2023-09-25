//
//  RecipeItemViewViewModel.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 21/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RecipeItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: RecipeListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("recipe")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
