//
//  GLButton.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI

struct GLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct GLButton_Previews: PreviewProvider {
    static var previews: some View {
        GLButton(title: "Value", background: .pink) {
            // Action
        }
    }
}
