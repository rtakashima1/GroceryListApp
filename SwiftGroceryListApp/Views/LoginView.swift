//
//  LoginView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()

    
    var body: some View {
        
        NavigationView {
            VStack{
                // Header
                HeaderView(title: "Grocery List", angle: 15, background: .pink
                )
                Form {
                    if !viewModel.errorMessage .isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    GLButton(title: "Log in",
                             background: .accentColor){
                        viewModel.login()
                    }
                }
                .scrollContentBackground(.hidden)
                
                // Create Account
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create an Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
            .background(
                Color(red: 243/255, green: 244/255, blue: 231/255)
//            Image("Untitled design")
//                .resizable()
//                .edgesIgnoringSafeArea(.all)
//                .overlay(Color.white.opacity(0.65))
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )

        }
        
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
