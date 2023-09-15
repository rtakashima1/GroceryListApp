//
//  Extensions.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 15/09/2023.
//

import Foundation

extension Encodable {
    func asDictionary () -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
