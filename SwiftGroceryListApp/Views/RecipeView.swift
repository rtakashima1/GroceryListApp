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
    @FirestoreQuery var recipeItems: [IngredientsDictionaryItem]
    @FirestoreQuery var recipeItems2: [RecipeListItem]
    
    init(userId: String) {
        // db setup: users/<id>/grocery/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/grocery")
        self._recipeItems = FirestoreQuery(collectionPath: "users/\(userId)/dictionary")
        self._recipeItems2 = FirestoreQuery(collectionPath: "users/\(userId)/recipe")
        self._viewModel = StateObject(wrappedValue: RecipeViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            ZStack {
                Color("Color")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    bodyListView
                }
            }
            
            .navigationTitle("Recipe")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.accentColor)
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewRecipeView(viewModel: NewRecipeViewViewModel(userId: "1D7Q0zQFIHN4e6F8pMq2otHwKAl2"), newItemPresented: $viewModel.showingNewItemView, ingredientItems: _recipeItems)
            }
        }
        
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    var bodyListView: some View {
        VStack{
            List{
                ForEach(recipeItems2) {recipe in
                    RecipeItemView(item: recipe)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: recipe.id)
                            }
                            .tint(.red)
                        }
                }
            }
            
        }
        .scrollContentBackground(.hidden)
    }
    
    var gDict: [String: [GroceryListItem]] {
        let categories = viewModel.retrieveDistinctCategory(items: items)
        var dict: [String: [GroceryListItem]] = [:]
        for cat in categories {
            dict[cat] = items.filter({$0.category == cat})
        }
        return dict
    }
    
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView(userId: "1D7Q0zQFIHN4e6F8pMq2otHwKAl2")
//        RecipeView()
    }
}
