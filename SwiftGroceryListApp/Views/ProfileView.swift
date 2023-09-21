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
            ZStack{
                Color("Color")
                    .edgesIgnoringSafeArea(.all)
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
                        Image("Loading ...")
                            .resizable()
                    }
                }
                .navigationTitle("Profile")
            }
            }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
