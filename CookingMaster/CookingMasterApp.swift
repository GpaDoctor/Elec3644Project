//
//  CookingMasterApp.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//

import SwiftUI
import CoreData

@main
struct CookingMasterApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            SplashScreenView()
//            AppView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
                .environmentObject(locationManager)
                .onAppear {
                                }
        }
    }
}
