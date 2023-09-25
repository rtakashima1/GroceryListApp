//
//  RecipeIngredientView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 21/09/2023.
//

import SwiftUI

struct RecipeIngredientView: View {
    @StateObject var viewModel = RecipeIngredientViewViewModel()
    let item: IngredientsDictionaryItem
    
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
                      "checkmark.circle.fill" : "circle" )
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.accentColor)
            }
            
        }
    }
}

struct RecipeIngredientView_Preview: PreviewProvider {
    static var previews: some View {
        RecipeIngredientView(item: .init(id: "333",
                             title: "Coffee",
                             category: "Protein",
                             isDone: false))
    }
}
