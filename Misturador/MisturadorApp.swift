//
//  MisturadorApp.swift
//  Misturador
//
//  Created by Taqtile on 16/12/22.
//

import SwiftUI

@main
struct MisturadorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
