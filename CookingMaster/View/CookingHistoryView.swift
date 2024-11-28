//
//  CookingHistory.swift
//  CookingMaster
//
//  Created by Lawrence on 26/11/2024.
//
//


import SwiftUI
import CoreData

struct CookingHistoryView: View {
    @Environment(\.managedObjectContext) private var viewContext

    // Fetch cooked recipes
    @FetchRequest(
        entity: CookedRecipe.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \CookedRecipe.dateCooked, ascending: false)]
    ) private var cookedRecipes: FetchedResults<CookedRecipe>

    // Access to all recipes
    var allRecipes: [Recipe] = recipesData // Replace with your actual data source

    // Grouped recipes by date
    private var groupedRecipes: [String: [Recipe]] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium

        let grouped = Dictionary(grouping: cookedRecipes.compactMap { cookedRecipe in
            allRecipes.first(where: { $0.id == cookedRecipe.id })
        }) { recipe -> String in
            if let dateCooked = cookedRecipes.first(where: { $0.id == recipe.id })?.dateCooked {
                return dateFormatter.string(from: dateCooked)
            } else {
                return "Unknown Date"
            }
        }
        return grouped
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(groupedRecipes.keys.sorted(by: { $0 > $1 }), id: \.self) { dateKey in
                    Section(header: Text(dateKey)) {
                        ForEach(groupedRecipes[dateKey] ?? []) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                HStack {
                                    Image(recipe.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(5)
                                        .clipped()
                                    VStack(alignment: .leading) {
                                        Text(recipe.title)
                                            .font(.headline)
                                        Text("By \(recipe.chef)")
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                }
                            }
                        }
                        .onDelete { indexSet in
                            deleteRecipe(at: indexSet, in: dateKey)
                        }
                    }
                }
            }
            .navigationTitle("Cooking History")
            .toolbar {
                EditButton()
            }
        }
    }

    private func deleteRecipe(at offsets: IndexSet, in dateKey: String) {
        for index in offsets {
            if let recipe = groupedRecipes[dateKey]?[index],
               let cookedRecipe = cookedRecipes.first(where: { $0.id == recipe.id }) {
                viewContext.delete(cookedRecipe)
            }
        }
        do {
            try viewContext.save()
        } catch {
            print("Error deleting recipe: \(error)")
        }
    }
}


//struct CookingHistoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CookingHistoryView()
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
