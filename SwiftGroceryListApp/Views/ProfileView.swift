//
//  ProfileView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView{
            VStack {
                if let user = viewModel.user {
                    // avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(width: 125, height: 125)
                    // Info: name, email
                    VStack {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        HStack {
                            Text("email: ")
                                .bold()
                            Text(user.email)
                        }
                        HStack {
                            Text("Joined: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date:.abbreviated, time: .shortened))")
                        }
                    }.padding()

                    // sign out
                    Button("Log Out"){
                        viewModel.logOut()
                    }
                    .buttonStyle(.bordered)
                    .tint(.accentColor)
                    .padding(100)
                } else {
                    Text("Loading Profile ... ")
                }
            }
            .background(
                
                Color(red: 243/255, green: 244/255, blue: 231/255)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
//            Image("Untitled design")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//                .overlay(Color.white.opacity(0.65))
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
            .navigationTitle("Profile")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear{
            viewModel.fetchUser()
        }
    }
}
//@ViewBuilder
//func profile(user: User) -> some View {
//
//}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
