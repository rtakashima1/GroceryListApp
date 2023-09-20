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
    
    @State private var catTest: CatTest = .cat
    var uniqueCategories: [String] {
        return Array(Set(
            (items).compactMap{$0.category}))
    }
  
    
    @State private var sortTest: SortTest = .cat
    var sortedListTest: [GroceryListItem] {
        return items.sorted{$0.category < $1.category}
    }
    
    enum SortTest {
        case cat
    }
    
    enum CatTest {
        case cat
    }
    
    
//    enum SortOption {
//        case category, completed
//    }
    
//    @State private var sortOption: SortOption = .completed
//    var sortedList: [GroceryListItem] {
//        switch sortOption {
//        case .category:
//            return items.sorted { $0.category < $1.category}
//        case .completed:
//            return items.sorted {!$0.isDone && $1.isDone}
//        }
//    }
    
    init(userId: String) {
        // db setup: users/<id>/grocery/<entries>
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/grocery")
        self._viewModel = StateObject(wrappedValue: GroceryListViewViewModel(userId: userId))
    }
    
    var body: some View {
        
        NavigationView{
//            bodyListViewTest
//                .padding()
//                .background(
//                    Image("Untitled design")
//                        .resizable()
//                        .edgesIgnoringSafeArea(.all)
//                        .overlay(Color.white.opacity(0.65))
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//            )
            
            bodyListView2
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
            
            ForEach(sortedListTest) { item in
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
    
//    var bodyListViewTest: some View {
//        VStack {
//            ForEach(uniqueCategories, id:\.self){ categoryItem in
//                Section(header: Text(categoryItem)) {
//                    ForEach(sortedListTest) { item in
//                        GroceryItemView(item: item)
//                            .swipeActions {
//                                Button("Delete") {
//                                    viewModel.delete(id: item.id)
//                                }
//                                .tint(.red)
//                            }
//                            .listRowBackground(Color.white.opacity(0.7))
//                    }
//                    .scrollContentBackground(.hidden)
//                    }
//                }
//            }
//        }
    
    
    var bodyListView2: some View {
        VStack{
            List {
                ForEach(Array(gDict.keys).sorted(by: <), id: \.self) { category in
                    Section(header: Text("\(category)")) {
                        ForEach(gDict[category]!, id: \.self) { listItem in
                            GroceryItemView(item: listItem)
                        }
                    }
                }
            }
        }
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




struct GroceryListView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryListView(userId: "1D7Q0zQFIHN4e6F8pMq2otHwKAl2")
    }
}
