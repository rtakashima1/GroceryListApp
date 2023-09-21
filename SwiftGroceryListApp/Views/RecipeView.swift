//
//  RecipeView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 20/09/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct RecipeView: View {
    
    @StateObject var viewModel: RecipeViewViewModel
    @FirestoreQuery var items: [GroceryListItem]
    
    init(userId: String) {
        // db setup: users/<id>/grocery/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/grocery")
        self._viewModel = StateObject(wrappedValue: RecipeViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                bodyListView
                Text("Helow")
            }
            .navigationTitle("Recipe")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
                }
            }
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var bodyListView: some View {
        VStack{
            Text("Hello")
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(userId: "1D7Q0zQFIHN4e6F8pMq2otHwKAl2")
    }
}
