//
//  ResultView.swift
//  CookingMaster
//
//  Created by Lawrence on 28/11/2024.
//

import SwiftUI

struct ResultView: View {
    var filteredRecipes: [Recipe]
    var searchText: String
    var selectedFilters: [String]

    var body: some View {
        VStack {
            if !filteredRecipes.isEmpty {
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(filteredRecipes) { recipe in
                            NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                                RecipeCardView(recipe: recipe)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding()
                }
            } else {
                VStack {
                    Spacer()
                    Text("No recipes found")
                        .foregroundColor(.gray)
                        .font(.headline)
                    Spacer()
                }
            }
        }
        .navigationBarTitle("Results", displayMode: .inline)
    }
}




struct FilterButton: View {
    var filter: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: {
            self.action()
        }) {
            Text(filter)
                .font(.subheadline)
                .padding(.vertical, 8)
                .padding(.horizontal, 12)
                .background(isSelected ? Color.blue : Color(.systemGray5))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}
