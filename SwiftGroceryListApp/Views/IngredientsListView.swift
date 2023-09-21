//
//  IngredientsListView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 21/09/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct IngredientsListView: View {
    
    @StateObject var viewModel: GroceryListViewViewModel
    @FirestoreQuery var items: [GroceryListItem]
    
    init(userId: String) {
        // db setup: users/<id>/grocery/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/grocery")
        self._viewModel = StateObject(wrappedValue: GroceryListViewViewModel(userId: userId))
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
                    ForEach(items) { item in
                        GroceryItemView(item: item)
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.delete(id: item.id)
                                }
                                .tint(.red)
                            }
                            .listRowBackground(Color.white.opacity(0.7))
                    }
                    .scrollContentBackground(.hidden)
                }
    }
}
        

struct IngredientsListView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsListView(userId: "1D7Q0zQFIHN4e6F8pMq2otHwKAl2")
    }
}
