//
//  NewRecipeView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 20/09/2023.
//

import SwiftUI

struct NewRecipeView: View {
    
    @StateObject var viewModel = NewRecipeViewViewModel()
    @Binding var newItemPresented: Bool
    
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
                        TextField("Recipe Title", text: $viewModel.title)
                        Picker("Choose Category", selection: $viewModel.category){
                            ForEach(themes, id: \.self){
                                Text($0)
                            }
                        }
                        Picker("Choose hmm", selection: $viewModel.category) {
                            ForEach(ingredientThemes, id: \.self){
                                Text($0)
                            }
                        }
                      // picker style here if you want to
                    }
                    Form{
                        TextField("hmm", text:$viewModel.ingredientsList)
                        TextField("hmm", text:$viewModel.ingredientsList)
                        
                    }
                    .padding()
                }
                .scrollContentBackground(.hidden)
            }
            
        }
        .navigationTitle("NewRecipe")
        .navigationViewStyle(StackNavigationViewStyle())
        .toolbar{
        }
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView(newItemPresented: Binding(get: {return true}, set: {_ in }))
    }
}
