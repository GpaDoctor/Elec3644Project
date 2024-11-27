//
//  RecipeListView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/27/24.
//

import Foundation
import SwiftUI
import CoreData

struct RecipeListView: View{
    
    @State var recipes: [Recipe] = recipesData
    @FetchRequest(
        entity: RecipeEntity.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \RecipeEntity.title, ascending: true)]
    ) var fetchedRecipes: FetchedResults<RecipeEntity>
    
    var body: some View{

        ScrollView(.vertical, showsIndicators: false){
            ForEach(recipes){ recipe in
                RecipeSmallCardView(recipe: recipe)
            }
            ForEach(fetchedRecipes, id: \.id) { recipeEntity in
                RecipeSmallCardView(recipe: mapRecipeEntityToRecipe(recipeEntity))
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
                category: entity.category ?? ""
            )
        }
    
}

struct RecipeListView_Previews: PreviewProvider{
    static var previews: some View {
        RecipeListView(recipes: recipesData)
    }
}
