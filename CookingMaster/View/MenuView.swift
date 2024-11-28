//
//  MenuView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI


struct MenuView: View {
    @State private var staticMenus: [Menu] = [] // Static menus (if any)
    @State private var userMenus: [Menu] = []   // Menus fetched from Core Data
    @State private var showMenu: Bool = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(combinedMenus) { menu in
                    NavigationLink(destination: MenuDetial(menu: menu, recipes: recipesData)) { // Navigate to details
                        MenuRowView(menu: menu, recipes: recipesData)
                            .padding(.vertical, 5) // Add spacing between rows
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationTitle("Menus")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showMenu = true
                    }) {
                        Image("greenplus")
                    }
                }
            }
            .sheet(isPresented: $showMenu) {
                AddMenuView(onSave: { newMenu in
                    userMenus.append(newMenu)
                })
            }
            .onAppear {
                fetchMenus() // Call fetchMenus when the view appears
            }
        }
    }

    // MARK: - Computed Properties
    private var combinedMenus: [Menu] {
        staticMenus + userMenus // Combine static menus and user-created menus
    }

    // MARK: - Fetch Menus
    private func fetchMenus() {
        staticMenus = menuData // Replace `menuData` with your static data source
        userMenus = PersistenceController.shared.fetchMenus()
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
            .onAppear {
            }
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
