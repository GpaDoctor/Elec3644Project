//
//  RecipeCookingView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//Author Name: Cheung Ching Pan (3036101721)
//
//

import SwiftUI
import CoreData

struct RecipeCookingView: View {
    // Property
    var recipe: Recipe

    // Access the managed object context
    @Environment(\.managedObjectContext) private var viewContext

    // Fetch favorite recipes
    @FetchRequest(
        entity: FavoriteRecipe.entity(),
        sortDescriptors: []
    ) private var favoriteRecipes: FetchedResults<FavoriteRecipe>

    // Body
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "person")
                Text("Chef: \(recipe.chef)")
            }
            .font(.footnote)
            .foregroundColor(.gray)

            HStack(alignment: .center, spacing: 2) {
                Image(systemName: "clock")
                Text("Prep: \(recipe.preparation)")
            }
            .font(.footnote)
            .foregroundColor(.gray)

            Spacer()

            // Heart button
            Button(action: {
                toggleFavorite()
            }) {
                Image(systemName: isFavorited ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }

    // Computed property to check if the recipe is favorited
    private var isFavorited: Bool {
        favoriteRecipes.contains(where: { $0.id == recipe.id })
    }

    // Function to toggle favorite status
    func toggleFavorite() {
        if isFavorited {
            // Remove from favorites
            if let favoriteRecipe = favoriteRecipes.first(where: { $0.id == recipe.id }) {
                viewContext.delete(favoriteRecipe)
                saveContext()
            }
        } else {
            // Add to favorites
            let newFavorite = FavoriteRecipe(context: viewContext)
            newFavorite.id = recipe.id
            saveContext()
        }
    }

    // Function to save context
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(recipe: recipesData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}

// Preview
//struct RecipeCookingView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Provide a sample recipe
//        let sampleRecipe = Recipe(id: UUID(), chef: "Sample Chef", preparation: "30 mins")
//        return RecipeCookingView(recipe: sampleRecipe)
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//            .previewLayout(.fixed(width: 320, height: 60))
//    }
//}
