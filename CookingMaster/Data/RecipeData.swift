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
        id:UUID(),
      title: "Sweet And Sour Pork",
      headline: "Experience a flavor explosion with this Sweet and Sour Pork recipe that'll transport your taste buds straight to a bustling Asian street market. This dish combines tender pork with a tangy, vibrant sauce for a meal that's sure to impress your friends and family.",
      image: "SweetAndSourPork-cover",
        chef: "Jaden C",
      rating: 5,
      serves: 2,
      preparation: 10,
      cooking: 25,
      instructions: [
        "01 In a bowl, combine all marinade ingredients with the pork. Cover and leave to marinade in the fridge 20 minutes.",
        "02 Place the corn flour in a large bowl and toss the marinated pork chunks until liberally coated.",
        "03 In a medium-sized saucepan, heat the oil to 350˚F (180°C).",
        "04 Deep fry the pork pieces for about 3-4 minutes until the coating is golden brown and the pork is cooked throughout. Set aside.",
        "05 For the sauce, place a frying pan over a medium heat and add the oil.",
        "06 Sauté the garlic until fragrant, then fry the peppers until soften.",
        "07 Add in the pineapple and warm thorough.",
        "08 Add the sugar, vinegar, and ketchup, stir. Bring the mixture to a boil.",
        "09 Add the pork to the frying pan and coat everything evenly with the sauce.",
        "10 Serve top with sesame seeds.",
        "11 Enjoy!"
      ],
      ingredients: [
        "½ lb pork(200 g), chopped into bite size pieces",
        "1 teaspoon salt",
        "1 teaspoon corn flour",
        "1 egg",
        "1 cup corn flour(100 g)",
        "2 ½ cups oil(500 mL)",
        "2 tablespoons oil",
        "2 teaspoons garlic, crushed",
        "½ green bell pepper, chopped",
        "½ red bell pepper, chopped",
        "⅔ cup pineapple(150 g)",
        "¼ cup white caster sugar(50 g)",
        "¼ cup rice vinegar(50 mL)",
        "2 tablespoons ketchup"
      ],
        category: "Asian",
        tags: ["Asian Cuisine", "Sweet and Sour", "Pork Recipe", "Quick and Easy", "Dinner", "Homemade", "Comfort Food", "Tangy Sauce", "Family Meal", "Street Food"]
    ),
    
    
    Recipe(
        id: UUID(),
      title: "Brownie Tiramisu",
      headline: "Close your eyes and take a bite of this dreamy dessert. The fudgy, chocolatey brownies mingle with the creamy, airy layers of tiramisu, creating a flavor explosion that'll transport you to an Italian cafe.",
      image: "BrownieTiramisu-cover",
      chef: "Gordon",
      rating: 3,
      serves: 4,
      preparation: 30,
      cooking: 70,
      instructions: [
        "Pre-heat oven to 350ºF (180°C).",
        "Combine brownie mix, egg, vegetable oil, and strong coffee into a large bowl. Mix well.",
        "Pour batter into a parchment lined 10x15-inch (25x38 cm) baking sheet.",
        "Bake for about 10 minutes.",
        "While the brownie is baking and cooling, mix mascarpone cheese, espresso powder, and vanilla extract together in a bowl until smooth.",
        "In a separate bowl, whip the heavy cream and gradually add in powdered sugar.",
        "When the cream is whipped, add to the mascarpone cheese mixture and gently fold until homogenous.",
        "Take the brownie out from the baking sheet put on a flat surface, then use either a mason jar lid or a cookie cutter to cut out as many circles as you can.",
        "To assemble the tiramisu, alternate the cream and brownie, starting with the cream.",
        "Chill tiramisu in the fridge for an hour.",
        "To serve, dust with cocoa powder and/or espresso powder.",
        "Enjoy!"
      ],
      ingredients: [
        "1 box brownie mix",
        "⅓ cup espresso(80 mL), or strong coffee",
        "⅓ cup vegetable oil(80 mL)",
        "1 egg",
        "1 cup heavy cream(240 mL)",
        "½ cup powdered sugar(60 g)",
        "15 oz mascarpone cheese(450 g)",
        "1 tablespoon espresso powder",
        "1 teaspoon vanilla extract"
      ],
        category: "Italian",
        tags: ["Italian", "Dessert", "Brownie", "Tiramisu", "Chocolate", "Coffee", "Creamy", "Sweet Treat", "Baking", "Homemade"]
    ),
    
    
    Recipe(
        id: UUID(),
        title: "Easy Fish Tacos",
        headline: "Crispy, golden-brown fish fillets, wrapped in warm corn tortillas and topped with a delicious slaw made with shredded cabbage, red onion, and sour cream. Serve a sprinkle of fresh cilantro and lime juice!",
        image: "EasyFishTacos-cover",
        chef: "Gordon",
        rating: 4,
        serves: 8,
        preparation: 15, //prepatation time
        cooking: 16, //cooking time
        instructions: [
            "01 In a large bowl, combine green cabbage, red onion, sour cream, lime juice, and salt. Chill until ready to serve.",
            "02 In a bowl, mix cayenne, garlic powder, cumin, salt, and pepper. Season each tilapia fillet on both sides with the seasoning mix.",
            "03 Over medium-high heat, cook 2 fillets at a time for 8 minutes, flipping halfway. Repeat for the remaining fillets.",
            "04 Using a fork, break apart the fillets into bite-size pieces.",
            "05 Right before serving, heat the corn tortillas in the pan over high heat. Remove from the pan and assemble the tacos with the cabbage slaw and tilapia.",
            "06 Garnish with cilantro and lime juice.",
            "07 Enjoy!"
        ],
        ingredients: [
            "3 cups green cabbage(300 g), shredded",
            "½ cup red onion(75 g), diced",
            "1 cup sour cream(230 g)",
            "1 lime, juiced",
            "¼ teaspoon salt",
            "4 tilapia fillets",
            "¼ teaspoon cayenne pepper, ground",
            "½ teaspoon garlic powder",
            "½ teaspoon cumin",
            "½ teaspoon salt",
            "½ teaspoon pepper",
            "16 corn tortillas",
            "cilantro, to taste",
            "lime, to taste"
        ],
        category: "Italian",
        tags: ["Mexican", "Dinner", "Fish Tacos", "Quick and Easy", "Seafood", "Healthy", "Crispy", "Homemade", "Family Meal", "Street Food"]),
    
    Recipe(
        id: UUID(),
        title: "Classic Margherita Pizza",
        headline: "A simple yet delicious classic Margherita Pizza made with fresh ingredients and a homemade crust.",
        image: "MargheritaPizza",
        chef: "GpaDoctor",
        rating: 4,
        serves: 4,
        preparation: 20,
        cooking: 15,
        instructions: [
            "Prepare the pizza dough and let it rise.",
            "Preheat the oven to 475°F (245°C).",
            "Roll out the dough on a floured surface.",
            "Spread tomato sauce evenly over the dough.",
            "Top with fresh mozzarella slices and basil leaves.",
            "Drizzle with olive oil and season with salt and pepper.",
            "Bake for 12-15 minutes until the crust is golden brown.",
            "Slice and serve hot."
        ],
        ingredients: [
            "1 batch pizza dough",
            "1 cup tomato sauce",
            "8 oz fresh mozzarella, sliced",
            "Fresh basil leaves",
            "2 tablespoons olive oil",
            "Salt and pepper to taste"
        ],
        category: "Italian",
        tags: ["Italian", "Pizza", "Vegetarian", "Homemade", "Classic", "Quick and Easy", "Comfort Food", "Family Meal", "Baking", "Fresh Ingredients"]
    ),
    
    Recipe(
    id: UUID(),
     title: "Spaghetti Carbonara",
     headline: "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
     image: "SpaghettiCarbonara",
    chef: "GpaDoctor",
     rating: 5,
     serves: 4,
     preparation: 15,
     cooking: 20,
     instructions: [
         "Cook the spaghetti according to package instructions.",
         "In a separate pan, cook the pancetta until crispy.",
         "In a bowl, whisk together eggs and grated Parmesan cheese.",
         "Drain the spaghetti and return it to the pot.",
         "Quickly mix in the egg and cheese mixture, stirring constantly.",
         "Add the pancetta and season with black pepper.",
         "Serve immediately with extra Parmesan cheese."
     ],
     ingredients: [
         "400g spaghetti",
         "150g pancetta, diced",
         "2 large eggs",
         "1 cup grated Parmesan cheese",
         "Black pepper to taste"
     ],
     category: "Italian",
    tags: ["Italian", "Pasta", "Classic", "Quick and Easy", "Comfort Food", "Dinner", "Homemade", "Cheesy", "Family Meal", "Traditional"]
 ),
    Recipe(
    id: UUID(),
    title: "Chicken Tikka Masala",
    headline: "A popular Indian dish with marinated chicken cooked in a creamy tomato sauce.",
    image: "ChickenTikkaMasala",
    chef: "GpaDoctor",
    rating: 5,
    serves: 4,
    preparation: 30,
    cooking: 40,
    instructions: [
        "Marinate the chicken with yogurt, lemon juice, and spices for at least 1 hour.",
        "Grill or cook the chicken until fully cooked.",
        "In a pan, sauté onions, garlic, and ginger until fragrant.",
        "Add tomato puree and cook until thickened.",
        "Stir in cream and spices, then add the cooked chicken.",
        "Simmer for 10-15 minutes until the sauce is well combined.",
        "Serve hot with rice or naan."
    ],
    ingredients: [
        "500g chicken breast, cubed",
        "1 cup yogurt",
        "2 tablespoons lemon juice",
        "2 teaspoons garam masala",
        "1 teaspoon turmeric",
        "1 teaspoon cumin",
        "1 teaspoon paprika",
        "1 onion, chopped",
        "2 cloves garlic, minced",
        "1 tablespoon ginger, minced",
        "1 cup tomato puree",
        "1 cup heavy cream",
        "Salt and pepper to taste"
    ],
    category: "Indian",
    tags: ["Indian", "Chicken", "Spicy", "Creamy", "Dinner", "Comfort Food", "Homemade", "Traditional", "Marinated", "Family Meal"]
),
    
    Recipe(
    id: UUID(),
    title: "Beef Tacos",
    headline: "Delicious and easy beef tacos with a variety of toppings.",
    image: "BeefTacos",
    chef: "GpaDoctor",
    rating: 2,
    serves: 4,
    preparation: 15,
    cooking: 20,
    instructions: [
        "Cook ground beef in a pan until browned.",
        "Add taco seasoning and water, simmer until thickened.",
        "Warm the taco shells in the oven.",
        "Fill the taco shells with beef and your favorite toppings.",
        "Serve immediately."
    ],
    ingredients: [
        "500g ground beef",
        "1 packet taco seasoning",
        "1/2 cup water",
        "8 taco shells",
        "Toppings: shredded lettuce, diced tomatoes, shredded cheese, sour cream, salsa"
    ],
    category: "Mexican",
    tags: ["Mexican", "Tacos", "Beef", "Quick and Easy", "Dinner", "Comfort Food", "Homemade", "Family Meal", "Street Food", "Toppings"]
),
Recipe(
    id: UUID(),
    title: "Teriyaki Salmon",
    headline: "A flavorful and healthy salmon dish with a sweet and savory teriyaki glaze.",
    image: "TeriyakiSalmon",
    chef: "GpaDoctor",
    rating: 3,
    serves: 4,
    preparation: 10,
    cooking: 20,
    instructions: [
        "Preheat the oven to 400°F (200°C).",
        "In a bowl, mix soy sauce, honey, garlic, and ginger to make the teriyaki sauce.",
        "Place the salmon fillets on a baking sheet and brush with the teriyaki sauce.",
        "Bake for 15-20 minutes until the salmon is cooked through.",
        "Serve with steamed rice and vegetables."
    ],
    ingredients: [
        "4 salmon fillets",
        "1/4 cup soy sauce",
        "2 tablespoons honey",
        "2 cloves garlic, minced",
        "1 tablespoon ginger, minced",
        "Steamed rice and vegetables for serving"
    ],
    category: "Japanese",
    tags: ["Japanese", "Salmon", "Teriyaki", "Healthy", "Dinner", "Quick and Easy", "Seafood", "Homemade", "Family Meal", "Glazed"]
)
//    Recipe(
//        chef: "Gordon",
//      title: "",
//      headline: "",
//      image: "",
//      rating: 5,
//      serves: 2,
//      preparation: 5,
//      cooking: 5,
//      instructions: [
//        ""
//      ],
//      ingredients: [
//        ""
//      ]
//    ),
//    
//    Recipe(
//        chef: "Gordon",
//      title: "",
//      headline: "",
//      image: "",
//      rating: 5,
//      serves: 2,
//      preparation: 5,
//      cooking: 5,
//      instructions: [
//        ""
//      ],
//      ingredients: [
//        ""
//      ]
//    ),
//    
//    Recipe(
//        chef: "Gordon",
//      title: "",
//      headline: "",
//      image: "",
//      rating: 5,
//      serves: 2,
//      preparation: 5,
//      cooking: 5,
//      instructions: [
//        ""
//      ],
//      ingredients: [
//        ""
//      ]
//    ),
//    
//    Recipe(
//        chef: "Gordon",
//      title: "",
//      headline: "",
//      image: "",
//      rating: 5,
//      serves: 2,
//      preparation: 5,
//      cooking: 5,
//      instructions: [
//        ""
//      ],
//      ingredients: [
//        ""
//      ]
//    ),
//    
//    Recipe(
//        chef: "Gordon",
//      title: "",
//      headline: "",
//      image: "",
//      rating: 5,
//      serves: 2,
//      preparation: 5,
//      cooking: 5,
//      instructions: [
//        ""
//      ],
//      ingredients: [
//        ""
//      ]
//    ),
//    
//    Recipe(
//        chef: "Gordon",
//      title: "",
//      headline: "",
//      image: "",
//      rating: 5,
//      serves: 2,
//      preparation: 5,
//      cooking: 5,
//      instructions: [
//        ""
//      ],
//      ingredients: [
//        ""
//      ]
//    ),
//    
//    Recipe(
//        chef: "Gordon",
//      title: "",
//      headline: "",
//      image: "",
//      rating: 5,
//      serves: 2,
//      preparation: 5,
//      cooking: 5,
//      instructions: [
//        ""
//      ],
//      ingredients: [
//        ""
//      ]
//    )
    
]
