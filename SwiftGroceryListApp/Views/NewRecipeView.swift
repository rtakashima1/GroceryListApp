//
//  NewRecipeView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 20/09/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct NewRecipeView: View {
    
    @StateObject var viewModel: NewRecipeViewViewModel
    @Binding var newItemPresented: Bool
    @FirestoreQuery var ingredientItems: [IngredientsDictionaryItem]
    
    let themes = ["Appetizer","Salad","Soup", "Entree", "Dessert", "Other"]
    let ingredientThemes = ["Veggie/Fruits", "Protein", "Dairy", "Other"]
    
     
    var body: some View {
        NavigationView{
            
            ZStack {
                Color("Color")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("New Recipe")
                        .font(.system(size: 36))
                        .bold()
                        .padding(.top, 25)
                    
                    
                    Form{
                        Section{
                            TextField("Recipe Title", text: $viewModel.title)
                            Picker("Choose Category", selection: $viewModel.category){
                                ForEach(themes, id: \.self){
                                    Text($0)
                                }
                            }
                        }
                        Section{
                            Text("Choose Ingredients")
                                .bold()
                            Text("If ingredients not shown, add it from the grocery list page")
                                .font(.system(size: 10))
                            
                        }
                        bodyIngredientsListView
                        GLButton(
                             title: "Save",
                            background: .accentColor){
                                if viewModel.canSave {
                                    viewModel.save()
                                    newItemPresented = false
                                } else {
                                    viewModel.showAlert = true
                                }
                        }
                        
                    }
                    .alert(isPresented: $viewModel.showAlert){
                        Alert(title: Text("Error"), message: Text("Please fill in all fields"))
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            
        }
        .navigationTitle("NewRecipe")
        .navigationViewStyle(StackNavigationViewStyle())
        .toolbar{
            Image(systemName: "plus.square")
        }
    }
    
    var bodyIngredientsListView: some View {
        
            List{
                ForEach(Array(rDict.keys).sorted(by: >), id: \.self) { category in
                    Section(header: Text("\(category)")) {
                        ForEach(rDict[category]!, id: \.self) { item in
                            RecipeIngredientView(item: item)
                                .swipeActions {
                                    Button("Delete") {
                                        viewModel.delete(id: item.id)
                                    }
                                    .tint(.red)
                                }
                        }
                    }
                }

            }
    }
    
    var rDict: [String: [IngredientsDictionaryItem]] {
        let categories = viewModel.retrieveDistinctCategory(items: ingredientItems)
        var dict: [String: [IngredientsDictionaryItem]] = [:]
        for cat in categories {
            dict[cat] = ingredientItems.filter({$0.category == cat})
        }
        return dict
    }
    
    
}

//struct NewRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewRecipeView(userId: Binding(get: {return true}, set: {_ in }))
//    }
//}
