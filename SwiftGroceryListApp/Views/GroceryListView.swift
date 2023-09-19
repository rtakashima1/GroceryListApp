//
//  GroceryListView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct GroceryListView: View {
    @StateObject var viewModel: GroceryListViewViewModel
    @FirestoreQuery var items: [GroceryListItem]
    
    var gList = [String]()
    
    init(userId: String) {
        // db setup: users/<id>/grocery/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/grocery")
        self._viewModel = StateObject(wrappedValue: GroceryListViewViewModel(userId: userId))
        
        // transparent background
//        UITableView.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        NavigationView{
            VStack {
                List(items) { item in
//                    Text(item.title)
                    GroceryItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                        .listRowBackground(Color.white.opacity(0.7))
                }.scrollContentBackground(.hidden)
                
//                .listStyle(PlainListStyle())
//                .listStyle(InsetGroupedListStyle())
                
            }
            .padding()
            .background(
            Image("Untitled design")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .overlay(Color.white.opacity(0.65))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
            .navigationTitle("Grocery List")
            .toolbar{
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.black)
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
        GroceryListView(userId: "1D7Q0zQFIHN4e6F8pMq2otHwKAl2")
    }
}
