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
    
    func retrieveDistinctCategory(items: [GroceryListItem]) -> [String] {
        return Array(Set(
            (items).compactMap{$0.category}))
    }
    
//    func matchesCategory(item: GroceryListItem, category: String) -> Bool {
//        if item.category == category {
//            return true
//        }
//        return false
//    }
//
//    func createGroceryGroups(items: [GroceryListItem]) -> [AnyObject] {
//        var gList = [AnyObject]()
//        let categories = retrieveDistinctCategory(items: items)
//        for cat in categories {
//            var simpleList = [GroceryListItem]()
//            for item in items {
//                if matchesCategory(item: item, category: cat) {
//                    simpleList.append(item)
//                }
//            }
//            gList.append(simpleList)
//        }
//
//        return gList
//    }
//
//    func addGroceryGroup(group: [GroceryListItem]) -> [[GroceryListItem]] {
//        return [GroceryListItem(id: "123", title: "test", category: "Other", createdDate: Date().timeIntervalSince1970, isDone: false)]
//    }
}
 
