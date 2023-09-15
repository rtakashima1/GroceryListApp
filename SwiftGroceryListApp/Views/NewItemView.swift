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
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            Form {
                // title
                TextField("Title", text: $viewModel.title)
                // button
                GLButton(title: "Save", background: .pink){
                    viewModel.save()
                }
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in }))
    }
}
