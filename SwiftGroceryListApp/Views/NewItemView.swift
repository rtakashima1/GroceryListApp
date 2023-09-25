//
//  NewItemView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    let themes = ["Veggie/Fruits", "Protein", "Dairy/Egg", "Other"]
    
    var body: some View {
        ZStack{
            Color("Color")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("New Item")
                    .font(.system(size: 36))
                    .bold()
                    .padding(.top, 25)
                Form {
                    // title
                    TextField("Item Title", text: $viewModel.title)
                    TextField("Category", text: $viewModel.category)
                    Picker("Choose Category", selection: $viewModel.category){
                        ForEach(themes, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.wheel)
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
                
        }
//        Image("Untitled design")
//            .resizable()
//            .edgesIgnoringSafeArea(.all)
//            .overlay(Color.white.opacity(0.65))
//            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in }))
    }
}
