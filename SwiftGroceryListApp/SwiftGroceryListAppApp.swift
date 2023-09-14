//
//  SwiftGroceryListAppApp.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 14/09/2023.
//

import SwiftUI

@main
struct SwiftGroceryListAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
