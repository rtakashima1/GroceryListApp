//
//  ContentView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 14/09/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            // signed in
            TabView {
                GroceryListView(userId: viewModel.currentUserId)
                    .tabItem {(Label("List", systemImage: "checklist"))}
                RecipeView(userId: viewModel.currentUserId)
                    .tabItem {(Label("Recipe", systemImage: "newspaper"))}
                ProfileView()
                    .tabItem {(Label("Profile", systemImage: "person.circle"))}
            }
        } else {
            LoginView()
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
