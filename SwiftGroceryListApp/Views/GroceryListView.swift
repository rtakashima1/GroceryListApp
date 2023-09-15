//
//  GroceryListView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI

struct GroceryListView: View {
    @StateObject var viewModel = GroceryListViewViewModel()
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView{
            VStack {
                
            }
            .navigationTitle("Grocery List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView(userId: "")
    }
}
