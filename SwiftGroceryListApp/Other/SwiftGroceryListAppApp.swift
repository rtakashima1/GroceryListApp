//
//  SwiftGroceryListAppApp.swift
//  SwiftGroceryListApp
//
//  Created by Rika Takashima on 14/09/2023.
//

import SwiftUI
import FirebaseCore

@main
struct SwiftGroceryListAppApp: App {
    init () {
        FirebaseApp.configure()
    }
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
