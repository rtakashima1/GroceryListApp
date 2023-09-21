//
//  HeaderView.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
//    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            VStack {
                Text(title)
                    .foregroundColor(.black)
//                    .font(.system(size: 50))
                    .font(.custom("Galvji", size: 48))
                    .bold()
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: UIScreen.main.bounds.height / 3)
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title",
                   angle: 15,
                   background: .blue)
    }
}
