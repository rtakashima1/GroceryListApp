//
//  GroceryItemView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI

struct GroceryItemView: View {
    @StateObject var viewModel = GroceryItemViewViewModel()
    let item: GroceryListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(
                        .custom("Galvji", fixedSize: 18))
//                        .custom("Menlo-Bold", fixedSize: 18))
//                Text(item.category)
//                    .font(
//                        .custom("Arial", fixedSize: 12))
////                    .font(.footnote)
//                    .foregroundColor(.secondary)
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ?
                      "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.accentColor)
            }
            
        }
    }
}

struct GroceryItemView_Previews: PreviewProvider {
    static var previews: some View {
        GroceryItemView(item: .init(id: "123", title: "Oat",category: "Dairy/Egg", createdDate: Date().timeIntervalSince1970, isDone: false))
    }
}
