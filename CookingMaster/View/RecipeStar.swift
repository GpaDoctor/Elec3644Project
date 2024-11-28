//
//  RecipeStar.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
// Author Name: Cheung Ching Pan (3036101721)
//

import SwiftUI

struct RecipeStarView: View {
    
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(recipe.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                    .foregroundColor(.green)
            }
        }
    }
    
}
//preview
struct RecipeStarView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeStarView(recipe: recipesData[1])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
