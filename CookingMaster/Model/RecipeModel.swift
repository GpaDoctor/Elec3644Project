//
//  RecipeModel.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//

import Foundation
import SwiftUI

struct Recipe: Identifiable {
    var chief: String
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var rating: Int
    var serves: Int
    var preparation: Int
    var cooking: Int
    var instructions: [String]
    var ingredients: [String]
}


