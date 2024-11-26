//
//  RecipeDetailView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/26/24.
//

import Foundation
import SwiftUI

struct RecipeDetail: View {
    var recipe: Recipe
    var body: some View {
        ScrollView (.vertical, showsIndicators: false){
            VStack (){
                
            }
        }
    }
}
struct RecipeDetailView_Previews {
    static var previews: some View{
        RecipeDetail(recipe: recipesData[0])
    }
}

