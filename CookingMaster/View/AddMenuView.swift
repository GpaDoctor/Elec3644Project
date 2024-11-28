//
//  AddRecipeView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/27/24.
//Author Name: Cheung Ching Pan (3036101721)
//

import SwiftUI


struct AddMenuView: View {
    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.managedObjectContext) private var viewContext

    @State private var name: String = ""
    @State private var date: Date = Date()
    @State private var searchText: String = ""
    @State private var allRecipes: [Recipe] = []
    @State private var selectedRecipes: [Recipe] = []

    var onSave: ((Menu) -> Void)? // Callback to return the new menu

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Menu Name", text: $name)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                DatePicker("Select Date", selection: $date, displayedComponents: [.date])
                    .padding(.horizontal)

                TextField("Search Recipes", text: $searchText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                List {
                    ForEach(filteredRecipes, id: \.id.uuidString) { recipe in
                        HStack {
                            RecipeCardforMenu(recipe: recipe)
                            Spacer()
                            if selectedRecipes.contains(where: { $0.id.uuidString == recipe.id.uuidString }) {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            toggleRecipeSelection(recipe)
                        }
                    }
                }

                Button(action: saveMenu) {
                    Text("Save Menu")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.top)
            }
            .navigationTitle("Add Menu")
            .onAppear(perform: fetchAllRecipes)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }

    // Computed Properties
    private var filteredRecipes: [Recipe] {
        if searchText.isEmpty {
            return allRecipes
        } else {
            return allRecipes.filter {
                $0.title.lowercased().contains(searchText.lowercased())
            }
        }
    }

    // Fetch all recipes
    private func fetchAllRecipes() {
        let staticRecipes = recipesData
        let coreDataRecipes = PersistenceController.shared.fetchRecipes()
        allRecipes = staticRecipes + coreDataRecipes
    }

    private func toggleRecipeSelection(_ recipe: Recipe) {
        if let index = selectedRecipes.firstIndex(where: { $0.id.uuidString == recipe.id.uuidString }) {
            selectedRecipes.remove(at: index)
        } else {
            selectedRecipes.append(recipe)
        }
    }

    private func saveMenu() {
        guard !name.isEmpty else { return }

        let ids = (selectedRecipes.map { $0.id.uuidString }).joined(separator: ",")
        
        let newMenu = Menu(
            id: UUID(),
            name: name,
            dishID: ids,
            date: date
        )

        // Save to Core Data
        PersistenceController.shared.saveMenu(menu: newMenu)

        // Return new menu via callback
        onSave?(newMenu)

        // Dismiss view
        presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - Preview

struct AddMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AddMenuView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
