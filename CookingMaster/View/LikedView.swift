//
//  LikedView.swift
//  CookingMaster
//
//  Created by Lawrence on 26/11/2024.
//

import Foundation
import SwiftUI
import CoreData

//struct LikedView: View {
//    var body: some View {
//        Text("LikedView")
//    }
//}
struct LikedView: View {
    // Access the managed object context
    @Environment(\.managedObjectContext) private var viewContext

    // Fetch favorite recipes
    @FetchRequest(
        entity: FavoriteRecipe.entity(),
        sortDescriptors: []
    ) private var favoriteRecipes: FetchedResults<FavoriteRecipe>

    // Your recipes data source
    var allRecipes: [Recipe] = recipesData // Replace with your actual data source

    // Filters
    @State private var selectedFilter: FilterOption = .all

    var body: some View {
        NavigationView {
            VStack {
                // Filters at the top
                filterSection

                // Grid of recipe photos
                ScrollView {
                    if filteredRecipes.isEmpty {
                        Text("No recipes found.")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        LazyVGrid(columns: gridColumns, spacing: 10) {
                            ForEach(filteredRecipes) { recipe in
                                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                    RecipeGridItem(recipe: recipe)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Liked Recipes")
        }
    }

    // Computed property to get liked recipes
    private var likedRecipes: [Recipe] {
        let favoriteIDs = favoriteRecipes.compactMap { $0.id }
        return allRecipes.filter { favoriteIDs.contains($0.id) }
    }

    // Computed property for filtered recipes
    private var filteredRecipes: [Recipe] {
        switch selectedFilter {
        case .all:
            return likedRecipes
        case .category(let category):
            return likedRecipes.filter { $0.category == category }
        case .rating(let rating):
            return likedRecipes.filter { $0.rating >= rating }
        }
    }

    // Grid columns
    private var gridColumns: [GridItem] {
        [GridItem(.flexible()), GridItem(.flexible())]
    }

    // Filter options
    enum FilterOption: Hashable {
        case all
        case category(String)
        case rating(Int)

        var description: String {
            switch self {
            case .all:
                return "All"
            case .category(let category):
                return category
            case .rating(let rating):
                return "\(rating)+ Stars"
            }
        }
    }

    // Generate filter options dynamically
    private var filterOptions: [FilterOption] {
        var options: [FilterOption] = [.all]
        let categories = Set(likedRecipes.map { $0.category }).sorted()
        options.append(contentsOf: categories.map { .category($0) })
        options.append(.rating(4))
        options.append(.rating(5))
        return options
    }

    // Filter section view
    private var filterSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filterOptions, id: \.self) { option in
                    Button(action: {
                        selectedFilter = option
                    }) {
                        Text(option.description)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(selectedFilter == option ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedFilter == option ? .white : .black)
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 10)
        }
    }
}

struct RecipeGridItem: View {
    var recipe: Recipe

    var body: some View {
        VStack {
            Image(recipe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: (UIScreen.main.bounds.width / 2) - 25, height: 150)
                .clipped()
                .cornerRadius(10)
        }
    }
}
