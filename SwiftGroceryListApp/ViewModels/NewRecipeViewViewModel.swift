//
//  NewRecipeViewViewModel.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 20/09/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewRecipeViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var category = ""
    @Published var ingredients = [GroceryListItem]()
    @Published var ingredientsList = ""
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
        let newItem = RecipeListItem (
            id: newId,
            title: title,
            category: category,
            ingredients: ingredients,
            ingredientsList: ingredientsList,
            isDone: false)
        
        
        // Save Model to database as subcollection of current user
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("recipe")
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

