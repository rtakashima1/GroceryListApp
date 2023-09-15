//
//  User.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}

