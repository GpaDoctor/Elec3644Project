//
//  CookingMasterApp.swift
//  CookingMaster
//
//  Author Name: Cheung Man Hei Kay (3036106109)
//

import SwiftUI
import CoreData

@main
struct CookingMasterApp: App {
    let persistenceController = PersistenceController.shared


    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
