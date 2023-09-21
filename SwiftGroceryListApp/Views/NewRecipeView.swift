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
    
    let themes = ["Appetizer", "Entree", "Dessert", "Other"]
    let ingredientThemes = ["Veggie/Fruits", "Protein", "Dairy", "Other"]
    
    var body: some View {
        VStack{
            Text("New Recipe")
                .font(.system(size: 36))
                .bold()
                .padding(.top, 25)
            Form {
                
                Section{
                    // title
                    TextField("Recipe Title", text: $viewModel.title)
                    Picker("Meal Category", selection: $viewModel.category){
                        ForEach(themes, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                HStack{
                    Text("Ingredient")
                    Spacer()
                    Text("Category")
                }
                HStack{
                    TextField("Ingredient", text: $viewModel.ingredientsList)
                    Picker("", selection: $viewModel.category){
                        ForEach(ingredientThemes, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                HStack{
                    TextField("Ingredient", text: $viewModel.ingredientsList)
                    Picker("", selection: $viewModel.category){
                        ForEach(ingredientThemes, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                HStack{
                    TextField("Ingredient", text: $viewModel.ingredientsList)
                    Picker("", selection: $viewModel.category){
                        ForEach(ingredientThemes, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.automatic)
                }
                
//                Picker("Ingredients", selection: $viewModel.ingredients){
//                    ForEach(themes, id: \.self){
//                        Text($0)
//                    }
//                    .pickerStyle(.menu)
                // button
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
            .padding()
            .alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Error"), message: Text("Please fill in all fields"))
            }
        }
        .scrollContentBackground(.hidden)
        .background(
            
            Color(red: 243/255, green: 244/255, blue: 231/255)
        )
    }
}

struct NewRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipeView(newItemPresented: Binding(get: {return true}, set: {_ in }))
    }
}
