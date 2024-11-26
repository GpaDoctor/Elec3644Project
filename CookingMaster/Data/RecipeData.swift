//
//  RecipeData.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//

import Foundation
import SwiftUI

let recipesData: [Recipe] = [
    Recipe(
        chef: "Jaden C",
      title: "Salmon and baked vegetables — Fish Сhallenge",
      headline: "Colourful twist on a classic.",
      image: "salmon",
      rating: 5,
      serves: 4,
      preparation: 20,
      cooking: 0,
      instructions: [
        "In a small jar, add the olive oil, lemon juice, salt, pepper and the stalks of the parsely. Closed the lid and shake until combined into an almost creamy texture.",
        "Toast the bread slices on a griddle or in the toaster, allow to cool slightly",
        "In a large bowl combine the rest of your ingredients",
        "Pour the parsley dressing over and toss until the avocado and eggs creams the salad together",
        "Place a generous spoonful of the salad onto each slice of toast and serve"
      ],
      ingredients: [
        "1 punnet cherry Tomatoes, halved",
        "4 hard boiled eggs, halved and sliced",
        "1 carrot, cut into thin strips",
        "3 handfuls of mixed lettuce leaves, torn",
        "1 avocado, skin and seed removed and cut into cubes",
        "1 bunch of parsley, coarsley chopped",
        "2 tbsp. olive oil",
        "1 lemon, juiced",
        "Salt and pepper, to taste",
        "Loaf of your favourite bread, sliced"
      ]
    ),
    Recipe(
        chef: "Harry Potter",
      title: "Grilled Сheese and tomato Sandwich",
      headline: "The best toastie you'll ever make.",
      image: "sanwitch",
      rating: 5,
      serves: 2,
      preparation: 5,
      cooking: 5,
      instructions: [
        "Heat a non-stick frying pan over high heat. Cook bacon for 1-2 minutes each side or until crisp. Transfer to a plate lined with paper towel.",
        "Top 2 slices of sourdough with bacon, brie and avocado. Season with salt and pepper. Top with remaining bread and spread both sides with butter. Preheat a sandwich grill. Grill toasties until golden.",
        "If you don’t have a sandwich press you can preheat your oven to 190°C or 170°C fan-forced and bake the toasties for 5-8 minutes or until cooked."
      ],
      ingredients: [
        "4 rashers streaky bacon",
        "4 slices sourdough bread",
        "125g brie cheese, thickly sliced",
        "1 avocado, thickly sliced",
        "2 tbs butter"
      ]
    )
]
