//
//  RecipeIngredientViewViewModel.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 21/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RecipeIngredientViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: IngredientsDictionaryItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("dictionary")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
