//
//  RecipeCookingView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//

import Foundation
import SwiftUI

struct RecipeCookingView: View {
    //property
    var recipe: Recipe
    
    //body
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
                Image(systemName: "heart")
        }
        

    }
}

struct RecipeCookingView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCookingView(recipe: recipesData[0])
            .previewLayout(.fixed(width: 320, height: 60))
    }
}
