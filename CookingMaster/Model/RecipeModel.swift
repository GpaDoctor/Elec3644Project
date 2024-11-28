//
//  RecipeModel.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//Author Name: Cheung Ching Pan (3036101721)
//

import Foundation
import SwiftUI

struct Recipe: Identifiable {
    let id: UUID
    let title: String
    let headline: String
    let image: String
    let chef: String
    let rating: Int
    let serves: Int
    let preparation: Int
    let cooking: Int
    let instructions: [String]
    let ingredients: [String]
    let category: String
    var tags: [String]
}

