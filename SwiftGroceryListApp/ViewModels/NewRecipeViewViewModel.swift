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
    @Published var ingredientItems = [IngredientsDictionaryItem]()
    @Published var ingredientsList = ""
    @Published var showAlert = false
    
    @Published var showingNewItemView = false
    private let userId: String
    
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("dictionary")
            .document(id)
            .delete()
        // we don't need call back because Firestore Query in View is listening to live updates
    }
    
    func save() {
        guard canSave else {
            return
        }
        // 1. Get current user Id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // 2. Create models
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

