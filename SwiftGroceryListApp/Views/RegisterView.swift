//
//  RegisterView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       angle: -15,
                       background: .orange)
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                GLButton(
                    title: "Create an Account",
                    background: .pink
                ){
                    viewModel.register()
                }
            }
            .scrollContentBackground(.hidden)
            
            .offset(y: -50)
        }
        .background(
        Image("Untitled design")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .overlay(Color.white.opacity(0.65))
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
