//
//  CookingMasterApp.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//

import SwiftUI

@main
struct CookingMasterApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
