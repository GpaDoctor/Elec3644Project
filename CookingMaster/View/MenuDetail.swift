//
//  MenuDetail.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI
import CoreData

struct MenuDetial: View {
    var menu: Menu // Accept a Menu object
    var recipes: [Recipe]
    @FetchRequest(
    entity: RecipeEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \RecipeEntity.title, ascending: true)]
    ) var fetchedRecipes: FetchedResults<RecipeEntity>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                //title
                Text(menu.name)
                    .font(.system(.title, design: .serif))
                
                //recipe list
                VStack(alignment:.center,spacing: 20){
                    let uuidStrings = menu.dishID.split(separator: ",").map(String.init)
                    let uuidArray = uuidStrings.compactMap(UUID.init)
                    ForEach(uuidArray, id: \.self) { dishID in
                        if let recipe = recipes.first(where: { $0.id == dishID }) {
                            // Recipe from recipesData
                            RecipeSmallCardView(recipe: recipe)
                        } else if let recipeEntity = fetchedRecipes.first(where: { $0.id == dishID }) {
                            // Recipe from Core Data
                            let recipe = mapRecipeEntityToRecipe(recipeEntity)
                            RecipeSmallCardView(recipe: recipe)
                        }
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                Text("Shopping List")
                    .font(.system(.title, design: .serif))
                
                VStack(alignment:.center,spacing: 20){
                    let uuidStrings = menu.dishID.split(separator: ",").map(String.init)
                    let uuidArray = uuidStrings.compactMap(UUID.init)
                    ForEach(uuidArray, id: \.self) { dishID in
                        if let recipe = recipes.first(where: { $0.id == dishID }) {
                            // Recipe from recipesData
                            ForEach(recipe.ingredients, id: \.self) { item in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item)
                                        .font(.footnote)
                                        .multilineTextAlignment(.leading)
                                    Divider()
                                }
                            }
                        } else if let recipeEntity = fetchedRecipes.first(where: { $0.id == dishID }) {
                            // Recipe from Core Data
                            let recipe = mapRecipeEntityToRecipe(recipeEntity)
                            ForEach(recipe.ingredients, id: \.self) { item in
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(item)
                                        .font(.footnote)
                                        .multilineTextAlignment(.leading)
                                    Divider()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                //.navigationTitle(menu.name) // Set the navigation title
            }
        }
    }
    private func mapRecipeEntityToRecipe(_ entity: RecipeEntity) -> Recipe {
        return Recipe(
            id: entity.id ?? UUID(),
            title: entity.title ?? "",
            headline: entity.headline ?? "",
            image: entity.image ?? "",
            chef: entity.chef ?? "",
            rating: Int(entity.rating),
            serves: Int(entity.serves),
            preparation: Int(entity.preparation),
            cooking: Int(entity.cooking),
            instructions: entity.instructions?.components(separatedBy: ",") ?? [],
            ingredients: entity.ingredients?.components(separatedBy: ",") ?? [],
            category: entity.category ?? "",
            tags: entity.tags?.components(separatedBy: ",") ?? []
        )
    }
}
struct MenuDetail_Previews: PreviewProvider{
    static var previews: some View {
        MenuDetial(menu: menuData[0], recipes: recipesData)
    }
}
