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
      title: "Sweet And Sour Pork",
      headline: "Experience a flavor explosion with this Sweet and Sour Pork recipe that'll transport your taste buds straight to a bustling Asian street market. This dish combines tender pork with a tangy, vibrant sauce for a meal that's sure to impress your friends and family.",
      image: "SweetAndSourPork-cover",
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
        category: "Italian"
    ),
    
    
    Recipe(
        chef: "Gordon",
      title: "Brownie Tiramisu",
      headline: "Close your eyes and take a bite of this dreamy dessert. The fudgy, chocolatey brownies mingle with the creamy, airy layers of tiramisu, creating a flavor explosion that'll transport you to an Italian cafe.",
      image: "BrownieTiramisu-cover",
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
        category: "Italian"
    ),
    
    
    Recipe(
        chef: "Gordon",
        title: "Easy Fish Tacos",
        headline: "Crispy, golden-brown fish fillets, wrapped in warm corn tortillas and topped with a delicious slaw made with shredded cabbage, red onion, and sour cream. Serve a sprinkle of fresh cilantro and lime juice!",
        image: "EasyFishTacos-cover",
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
        category: "Italian")
    
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
