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
    
    enum SortOption {
        case category, completed
    }
    
    @State private var sortOption: SortOption = .completed
    var sortedList: [GroceryListItem] {
        switch sortOption {
        case .category:
            return items.sorted { $0.category < $1.category}
        case .completed:
            return items.sorted {!$0.isDone && $1.isDone}
        }
    }
    
    init(userId: String) {
        // db setup: users/<id>/grocery/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/grocery")
        self._viewModel = StateObject(wrappedValue: GroceryListViewViewModel(userId: userId))
    }
    
    var body: some View {
        
        NavigationView{
            bodyListView
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
    
    
    
    var bodyListView: some View {
        VStack {
            
            Picker("Sort By", selection: $sortOption) {
                Text("Completed").tag(SortOption.completed)
                Text("By Category").tag(GroceryListView.SortOption.category)
            }.pickerStyle(SegmentedPickerStyle())
            
            ForEach(sortedList) { item in
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

struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView(userId: "1D7Q0zQFIHN4e6F8pMq2otHwKAl2")
    }
}
