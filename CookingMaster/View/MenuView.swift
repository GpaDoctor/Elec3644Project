//
//  MenuView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI
import CoreData


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
                .onDelete(perform: deleteMenu) // Add swipe-to-delete functionality
            }
            .navigationTitle("Menus")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showMenu = true
                    }) {
                        Image("greenplus")
                            .padding(.top,110)
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
    // MARK: - Delete Menu
        private func deleteMenu(at offsets: IndexSet) {
            offsets.forEach { index in
                let menuToDelete = combinedMenus[index]

                // Remove from staticMenus or userMenus
                if let staticIndex = staticMenus.firstIndex(where: { $0.id == menuToDelete.id }) {
                    staticMenus.remove(at: staticIndex)
                } else if let userIndex = userMenus.firstIndex(where: { $0.id == menuToDelete.id }) {
                    userMenus.remove(at: userIndex)

                    // Delete from Core Data
                    if let menuEntity = fetchMenuEntity(by: menuToDelete.id) {
                        PersistenceController.shared.deleteMenu(menuEntity)
                    }
                }
            }
        }
    private func fetchMenuEntity(by id: UUID) -> MenuEntity? {
        let context = PersistenceController.shared.container.viewContext
        let fetchRequest: NSFetchRequest<MenuEntity> = MenuEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            return try context.fetch(fetchRequest).first
        } catch {
            print("Failed to fetch MenuEntity: \(error.localizedDescription)")
            return nil
        }
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
