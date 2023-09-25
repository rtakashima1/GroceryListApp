//
//  RecipeItemView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 21/09/2023.
//


import SwiftUI

struct RecipeItemView: View {
    @StateObject var viewModel = RecipeItemViewViewModel()
    let item: RecipeListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(
                        .custom("Galvji", fixedSize: 18))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?
                      "arrow.right.circle.fill" : "arrow.right.circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.accentColor)
            }
            
        }
    }
}

struct RecipeItemView_Preview: PreviewProvider {
    static var previews: some View {
//        RecipeItemView(item: .init(id: "123", title: "Oat", category: "Dairy/Egg", ingredientsList: "hmm", isDone: false))
        
        RecipeItemView(item: .init(id: "123", title: "Oat",category: "Dairy/Egg",
                                   ingredients: [GroceryListItem(id: "231", title: "Panko", category: "Other", createdDate: Date().timeIntervalSince1970, isDone: false)], ingredientsList: "hmm", isDone: false ))
    }
}
