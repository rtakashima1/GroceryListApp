//
//  GroceryItemViewViewModel.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class GroceryItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: GroceryListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("grocery")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
