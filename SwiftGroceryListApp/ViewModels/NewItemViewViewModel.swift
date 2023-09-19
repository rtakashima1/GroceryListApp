//
//  NewItemViewViewModel.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var category = ""
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        // 1. Get current user Id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // 2. Create model
        let newId = UUID().uuidString
        let newItem = GroceryListItem (
            id: newId,
            title: title,
            category: category,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        
        // Save Model to database as subcollection of current user
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("grocery")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
