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
      headline: "Enjoy this tasty Sweet and Sour Pork recipe - a flavorful blend of tender pork and tangy Asian-inspired sauce. Perfect for pleasing your loved ones!",
      image: "SweetAndSourPork-cover",
        chef: "Jaden C",
      rating: 5,
      serves: 2,
      preparation: 10,
      cooking: 25,
      instructions: [
        "In a bowl, combine all marinade ingredients with the pork. Cover and leave to marinade in the fridge 20 minutes.",
        "Place the corn flour in a large bowl and toss the marinated pork chunks until liberally coated.",
        "In a medium-sized saucepan, heat the oil to 350˚F (180°C).",
        "Deep fry the pork pieces for about 3-4 minutes until the coating is golden brown and the pork is cooked throughout. Set aside.",
        "For the sauce, place a frying pan over a medium heat and add the oil.",
        "Sauté the garlic until fragrant, then fry the peppers until soften.",
        "Add in the pineapple and warm thorough.",
        "Add the sugar, vinegar, and ketchup, stir. Bring the mixture to a boil.",
        "Add the pork to the frying pan and coat everything evenly with the sauce.",
        "Serve top with sesame seeds.",
        "Enjoy!"
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
        tags: ["Asian Cuisine", "Sweet and Sour", "Pork Recipe", "Quick and Easy", "Dinner", "Homemade", "Comfort Food", "Tangy Sauce", "Family Meal", "Street Food","Pork","Cuisine", "Asian", "Chinese", "Pork", "Eggs", "Meal", "Hig-Protein", "Under 1 Hour", "Pan Fry", "Stove Top", "Weeknight", "Date Night","Medium","Lunch"]
    ),
    
    
    Recipe(
        id: UUID(),
      title: "Brownie Tiramisu",
      headline: "Indulge in a heavenly dessert where fudgy brownies meet creamy tiramisu layers, whisking you away to an Italian cafe with every bite.",
      image: "BrownieTiramisu-cover",
      chef: "K Cheung",
      rating: 5,
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
        tags: ["Italian", "Dessert", "Brownie", "Tiramisu", "Chocolate", "Coffee", "Creamy", "Sweet Treat", "Baking", "Homemade","Cuisine", "European", "Italian", "Dairy", "Gluten", "Brownies", "Cakes", "Coffee", "> 60 mins", "Special Occasion", "No Bake Desserts", "Mashup","Medium"]
    ),
    
    
    Recipe(
        id: UUID(),
        title: "Easy Fish Tacos",
        headline: "Golden-brown fish fillets in corn tortillas with cabbage slaw, onion, sour cream, cilantro, and lime.",
        image: "EasyFishTacos-cover",
        chef: "Gordon",
        rating: 4,
        serves: 8,
        preparation: 15, //prepatation time
        cooking: 16, //cooking time
        instructions: [
            "In a large bowl, combine green cabbage, red onion, sour cream, lime juice, and salt. Chill until ready to serve.",
            "In a bowl, mix cayenne, garlic powder, cumin, salt, and pepper. Season each tilapia fillet on both sides with the seasoning mix.",
            "Over medium-high heat, cook 2 fillets at a time for 8 minutes, flipping halfway. Repeat for the remaining fillets.",
            "Using a fork, break apart the fillets into bite-size pieces.",
            "Right before serving, heat the corn tortillas in the pan over high heat. Remove from the pan and assemble the tacos with the cabbage slaw and tilapia.",
            "Garnish with cilantro and lime juice.",
            "Enjoy!"
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
        category: "Mexican",
        tags: ["Mexican", "Dinner", "Fish Tacos", "Quick and Easy", "Seafood", "Healthy", "Crispy", "Homemade", "Family Meal", "Street Food","Meal", "Dinner", "Tacos & Burritos", "Seafood", "Dairy", "Fish", "High-Fiber", "Low-Sugar", "High Protein", "< 60 mins", "30-60 mins", "Pescatarian","Easy", "Breakfast", "Lunch"]
    ),
    
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
        tags: ["Italian", "Pizza", "Vegetarian", "Homemade", "Classic", "Quick and Easy", "Comfort Food", "Family Meal", "Baking", "Fresh Ingredients","Medium","Lunch"]
    ),
    
    Recipe(
    id: UUID(),
     title: "Spaghetti Carbonara",
     headline: "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.",
     image: "SpaghettiCarbonara",
    chef: "L Law",
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
    tags: ["Italian", "Pasta", "Classic", "Quick and Easy", "Comfort Food", "Dinner", "Homemade", "Cheesy", "Family Meal", "Traditional","Easy","Lunch"]
     ),
    
        Recipe(
        id: UUID(),
        title: "Chicken Tikka Masala",
        headline: "A popular Indian dish with marinated chicken cooked in a creamy tomato sauce.",
        image: "ChickenTikkaMasala",
        chef: "VLEE",
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
        tags: ["Indian", "Chicken", "Spicy", "Creamy", "Dinner", "Comfort Food", "Homemade", "Traditional", "Marinated", "Family Meal","Medium","Lunch", "Dinner"]
    ),
        
        Recipe(
        id: UUID(),
        title: "Beef Tacos",
        headline: "Delicious and easy beef tacos with a variety of toppings.",
        image: "BeefTacos",
        chef: "Rae Law",
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
        tags: ["Mexican", "Tacos", "Beef", "Quick and Easy", "Dinner", "Comfort Food", "Homemade", "Family Meal", "Street Food", "Toppings","Esay","Breakfast", "Lunch"]
    ),
    Recipe(
        id: UUID(),
        title: "Teriyaki Salmon",
        headline: "A flavorful and healthy salmon dish with a sweet and savory teriyaki glaze.",
        image: "TeriyakiSalmon",
        chef: "Hell Chef",
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
        tags: ["Japanese", "Salmon", "Teriyaki", "Healthy", "Dinner", "Quick and Easy", "Seafood", "Homemade", "Family Meal", "Glazed", "Medium","Lunch", "Dinner"]
    ),
    
    
    Recipe(
        id: UUID(),
        title: "Ginger Tofu Dessert",
        headline: "Delight in Ginger Tofu Dessert with silky tofu and homemade ginger syrup, blending creamy, spicy, and sweet flavors.",
        image: "GingerTofuDessert-cover",
        chef: "Sarah Banh",
        rating: 5,
        serves: 4,
        preparation: 5,
        cooking: 10,
        instructions: [
          "Start by making the ginger syrup. Bring the water to a boil over medium heat, then add the ginger, brown sugar, and rock sugar.",
          "Cook, stirring occasionally, until all the sugar dissolves and the sauce thickens to your liking, 5-8 minutes.",
          "In a bowl, add the silken tofu pack.",
          "Drizzle tofu with about two-thirds of the ginger syrup, and reserve remaining syrup for another use.",
          "Enjoy!"
        ],
        ingredients: [
          "1 cup water",
          "5 slices of fresh ginger",
          "¼ cup packed brown sugar",
          "3 tablespoons rock sugar",
          "1 16-ounce pack silken tofu"
        ],
        category:"Asian",
            tags:["Asian","Meal", "Desserts", "Soy","Cooking Style", "Under 15 Minutes", "Healthy", "Comfort Food","Easy"]
    ),
    
    Recipe(
        id: UUID(),
        title: "Chinese Chicken Fried Rice",
        headline: "DIY take-out: seven ingredients, one pan. Quick, versatile, budget-friendly. Customize with protein. Skip take-out; it's simple!",
        image: "ChineseChickenFriedRice-cover",
        chef: "Evelyn Liu",
        rating: 4,
        serves: 2,
        preparation: 15,
        cooking: 20,
        instructions: [
          "Heat a wok over medium-high heat for 5 minutes. Add the oil then stir in eggs and fry until just cooked. Once cooked, remove eggs from the wok and set aside.",
          "Heat up the wok until smoking hot and pour in the oil.",
          "Add the chicken breast and fry until they are just cooked.",
          "Add the rice and keep frying until they turn slightly brown.",
          "Add the vegetables and fry everything together until they are thoroughly cooked.",
          "Pour in the soy sauce and stir.",
          "Add the cooked eggs back in and toss them around until they break into pieces.",
          "Add in the spring onions and serve.",
          "Enjoy!"
        ],
        ingredients: [
          "½ cup oil(100 mL)",
          "4 eggs",
          "1 pinch salt",
          "½ lb boneless, skinless chicken breast(200 g), sliced",
          "1 ¾ cups rice(400 g), cooked",
          "5 oz mixed vegetable(150 g)",
          "¼ cup light soy sauce(50 mL)",
          "1 oz spring onion(30 g)"
        ],
        category:"Asian",
        tags:["Asian","Cuisine", "Chinese", "Halal", "Chicken", "Soy", "Gluten", "Eggs", "Stir Fly", "Egg Breakfasts", "Meal", "Low-Sugar", "High-Protein","Medium"]
    ),
    
    Recipe(
        id: UUID(),
        title: "Garlic Butter Steak",
        headline: "Indulge in a perfectly seared steak topped with garlic butter. Pair with veggies or mashed potatoes for a royal feast!",
        image: "GarlicButterSteak-cover",
        chef: "Alvin Zhou",
        rating: 5,
        serves: 2,
        preparation: 10,
        cooking: 48,
        instructions: [
          "Preheat oven to 200°F (95°C). Set a wire rack on top of a rimmed baking sheet.",
          "Generously season the steak on all sides with salt and pepper.",
          "Transfer the steak to the wire rack, then bake for 45–60 minutes, until the internal temperature reaches about 125°F (51°C) for medium-rare, or your desired doneness.",
          "Heat the canola oil in a cast-iron skillet over high heat until smoking. (Do not use olive oil, as its smoke point is significantly lower than that of canola oil and will smoke before reaching the desired cooking temperature.)",
          "Sear the steak for 30 seconds on the first side, then flip. Add the butter, garlic, rosemary, and thyme and swirl around the pan. Place the garlic and herbs on top of the steak and baste the steak with the butter using a large spoon for about 30 seconds, then flip and baste the other side for about 15 seconds. Turn the steak on its side to render off any excess fat.",
          "Transfer the steak to a cutting board or wire rack to rest for about 10 minutes. (Slicing the steak before the resting period has finished will result in a lot of the juices leaking out, which may not be desirable.)",
          "Slice the steak into ½-inch (1-cm) strips, then fan out the slices and serve.",
          "Enjoy!"
        ],
        ingredients: [
          "1 ribeye steak, 2-inch (5-cm)-thick, preferably USDA Prime",
          "kosher salt, to taste",
          "freshly ground black pepper, to taste",
          "3 tablespoons canola oil",
          "3 tablespoons unsalted butter",
          "3 cloves garlic, peeled and smashed",
          "2 sprigs fresh rosemary",
          "3 sprigs fresh thyme"
        ],
        category:"West",
        tags: ["Meal","West", "Dinner", "Beef", "Dairy", "Difficulty", "Cooking Style", "Low-Sugar", "High-Protein", "Keto", "Special Occasion", "One-Pot Or Pan", "Meal Prep","Esay"]
    ),
    
    Recipe(
        id: UUID(),
        title: "Ratatouille",
        headline: "Enjoy summer flavors with this easy ratatouille. Fresh veggies and herbs make a delicious French-inspired dish, ideal as a side or main course.",
        image: "Ratatouille-cover",
        chef: "Robin Broadfoot",
        rating: 4,
        serves: 8,
        preparation: 5,
        cooking: 5,
        instructions: [
          "Preheat the oven for 375˚F (190˚C).",
          "Using a sharp knife or a mandoline, slice the eggplant, tomatoes, squash, and zucchini into approximately ¹⁄₁₆-inch (1-mm)-thick rounds, then set aside.",
          "Make the sauce: Heat the olive oil in a 12-inch (30-cm) oven-safe pan over medium-high heat. Sauté the onion, garlic, and bell peppers until soft, about 10 minutes. Season with salt and pepper, then add the crushed tomatoes. Stir until the ingredients are fully incorporated. Remove from heat, then add the basil. Stir once more, then smooth the surface of the sauce with a spatula.",
          "Arrange the veggies in alternating slices, (for example, eggplant, tomato, squash, zucchini) on top of the sauce, working from the outer edge to the center of the pan. Season with salt and pepper.",
          "Make the herb seasoning: In a small bowl, mix together the basil, garlic, parsley, thyme, salt, pepper, and olive oil. Spoon the herb seasoning over the vegetables.",
          "Cover the pan with foil and bake for 40 minutes. Uncover, then bake for another 20 minutes, until the vegetables are softened.",
          "Serve hot as a main dish or side. The ratatouille is also excellent the next day–cover with foil and reheat in a 350˚F (180˚C) oven for 15 minutes, or simply microwave to desired temperature.",
          "Enjoy!"
        ],
        ingredients: [
          "2 eggplants",
          "6 roma tomatoes",
          "2 yellow squashes",
          "2 zucchinis",
          "2 tablespoons olive oil",
          "1 medium white onion, diced",
          "4 cloves garlic, minced",
          "1 red bell pepper, seeded and diced",
          "1 yellow bell pepper, seeded and diced",
          "kosher salt, to taste",
          "freshly ground black pepper, to taste",
          "28 oz crushed tomatoes(795 g)",
          "2 tablespoons thinly sliced fresh basil",
          "2 tablespoons thinly sliced fresh basil",
          "1 teaspoon minced garlic",
          "2 tablespoons finely chopped fresh parsley",
          "2 teaspoons fresh thyme leaves",
          "kosher salt, to taste",
          "freshly ground black pepper, to taste",
          "4 tablespoons olive oil"
        ],
        category:"French",
        tags:["Cuisine", "European", "French", "Kosher", "Halal", "Dietary", "Meal", "Seasonal", "Appliance", "Cooking Style", "High-Fiber", "Low-Fat", "Low-Sugar", "Hard","Vegetarian", "Vegan"]
    ),
    
    Recipe(
        id: UUID(),
        title: "Broccoli Chicken Alfredo Lasagna",
        headline: "Savor cheesy chicken-broccoli lasagna twist with layers of comfort.",
        image: "BroccoliChickenAlfredoLasagna-cover",
        chef: "Claire Nolan",
        rating: 3,
        serves: 6,
        preparation: 30,
        cooking: 45,
        instructions: [
          "01 Preheat oven to 375˚F (190˚C).",
          "02 In a saucepan, melt butter. Add the garlic, heavy cream, and pepper. Stirring constantly, bring to a boil and reduce heat to a simmer.",
          "03 Add Parmesan cheese and keep stirring until sauce has thickened.",
          "04 Spread a generous spoonful of sauce on the bottom of a 9x13 inch pan and cover with 3 cooked lasagna noodles. Follow with a layer shredded chicken, broccoli, and mozzarella. Add more sauce, and repeat to make another layer. On top of the last noodle layer, cover with the remainder of the sauce, and mozzarella.",
          "05 Cover with foil and bake for 30 minutes. Remove the foil, and bake for 15 more minutes, until the cheese has browned.",
          "06 Nutrition Calories: 3332 Fat: 231 grams Carbs: 232 grams Fiber: 32 grams Sugars: 24 grams Protein: 132 grams",
          "07 Enjoy!"
        ],
        ingredients: [
          "4 tablespoons butter",
          "1 ½ tablespoons garlic, minced",
          "2 ½ cups heavy cream(600 g)",
          "½ teaspoon black pepper",
          "¾ cup grated parmesan cheese(85 g)",
          "9 lasagna noodles, cooked",
          "1 rotisserie chicken, shredded",
          "2 cups broccoli(500 g), chopped",
          "2 cups mozzarella cheese(230 g)"
        ],
        category:"Italian",
            tags:["Cuisine", "European", "Italian", "Chicken", "Dairy", "Gluten", "Lasagna", "Chicken", "Meal","High-Protein", "Stove Top", "Weeknight", "Baking","Medium"]
    ),
    
    Recipe(
        id: UUID(),
        title: "Show-Stopping Beef Wellington",
        headline: "Create a stunning beef Wellington: season beef, add mustard, mushrooms, prosciutto, wrap in puff pastry, bake for perfection.",
        image: "Show-StoppingBeefWellington-cover",
        chef: "Matthew Johnson",
        rating: 5,
        serves: 12,
        preparation: 60,
        cooking: 43,
        instructions: [
          "Let the beef tenderloin come to room temperature. Season with kosher salt and pepper on all sides.",
          "Add canola oil to a large pan on high heat. Once the oil is hot, add the tenderloin. Without moving the tenderloin, cook until a dark brown crust forms, about 3 minutes per side. Repeat searing on all sides, including the tenderloin ends.",
          "Remove the tenderloin from the pan and transfer to a cutting board or wire rack and remove ties.",
          "Brush the mustard on all sides of the meat while it’s still warm. Let the meat rest for while making the duxelle (mushrooms cooked and reduced until dry).",
          "To the same pan, add the butter, mushrooms, minced shallot, and minced garlic over medium-high heat. Cook, stirring occasionally, until all the liquid evaporates and the mushroom mixture becomes a thick 25-30 minutes, dry-like paste. Season with salt and pepper to taste.",
          "Remove the mushrooms from the pan and let cool completely.",
          "Place a large layer of overlapping sheets of plastic wrap on your work surface that is twice the length and width of the tenderloin.",
          "Lay overlapping strips of prosciutto on the plastic into an even square layer.",
          "Spread a layer of the mushrooms evenly over the prosciutto.",
          "Tightly and evenly wrap the tenderloin with the prosciutto, using the plastic wrap to wrap it even tighter and seal ends. Tie the ends of the plastic wrap together to hold the Wellington’s shape. Place in the refrigerator for 15 minutes.",
          "Preheat oven to 400°F (200°C).",
          "Place a new layer of plastic wrap on the work surface and lay a sheet of puff pastry over it. Unwrap the prosciutto-wrapped beef tenderloin onto the puff pastry, wrapping until the ends meet. Cut off any extra puff pastry, making sure there is no overlap.",
          "Wrap the puff pastry in plastic wrap, tying the ends together to form a log shape. Place in the refrigerator for 15 minutes.",
          "Place the beef Wellington on a greased, parchment paper-lined baking sheet. Brush the surface with the beaten eggs. With a fork, score a decorative design onto the surface of the puff pastry.",
          "Decorate with additional pastry (optional). Sprinkle with kosher salt.",
          "Bake for 40 minutes or until the puff pastry is a dark golden brown and the internal temperature of the beef is 135°F (57°C) for medium-rare.",
          "Enjoy!"
        ],
        ingredients: [
          "3 lb center-cut beef tenderloin(1 ½ kg)",
          "kosher salt, to taste",
          "black pepper, to taste",
          "2 tablespoons canola oil",
          "¼ cup english mustard(60 g)",
          "1 tablespoon butter",
          "2 shallots, minced",
          "2 lb cremini mushroom(910 g), minced",
          "5 cloves garlic, minced",
          "½ lb prosciutto(225 g), thinly sliced, or ham",
          "1 sheet puff pastry",
          "2 eggs, beaten"
        ],
        category:"West",
        tags:["Cuisine", "European", "British", "Dairy", "Gluten", "Eggs", "Beef", "Occasion", "Holidays", "Difficulty", "Meal", "Low-Sugar", "High-Protein", "Under 1 Hour","Hard"]
    ),
    
    Recipe(
        id: UUID(),
        title: "50-Clove Garlic Crab-Stuffed Salmon",
        headline: "Enjoy Garlic Crab-Stuffed Salmon: succulent salmon with crab, garlic butter, herbs, Old Bay. Baked to perfection for special occasions.",
        image: "50-CloveGarlicCrab-StuffedSalmon-cover",
        chef: "Joelle Park",
        rating: 3,
        serves: 6,
        preparation: 15,
        cooking: 20,
        instructions: [
          "01 Preheat the oven to 425°F (220°C).",
          "02 In a skillet, heat the olive oil over medium heat. Add the garlic, and cook until it’s softened, 3-4 minutes. Divide the cooked garlic in half.",
          "03 Make the garlic butter: In a bowl, mix together the melted butter, half of the cooked garlic, and ½ teaspoon of the Old Bay seasoning. Set aside.",
          "04 In a large mixing bowl, combine the crabmeat, mayonnaise, Dijon mustard, crushed Ritz crackers, lemon zest, lemon juice, 1 teaspoon of the Old Bay seasoning, the parsley, and the remaining cooked garlic. Gently mix to avoid breaking up the crabmeat. Season with salt and pepper to taste.",
          "05 Place the salmon fillets on a lined baking sheet. Carefully cut a slit in the center of each fillet to create a pocket for the stuffing. Generously season the salmon with the remaining Old Bay seasoning and a little salt to taste.",
          "06 Divide the crab mixture evenly among the fillets, pressing it into the pockets and mounding any extra on top. Pour some of the garlic butter over the top of the salmon.",
          "07 Place the baking sheet in the preheated oven, and bake for 12-15 minutes, until the salmon is just cooked through and the crab filling is golden.",
          "08 Remove from the oven, and brush the salmon with more of the garlic butter. Garnish with chives.",
          "09 Enjoy!"
        ],
        ingredients: [
          "2 tablespoons olive oil",
          "1 cup unsalted butter, melted",
          "50 garlic cloves, minced and divided",
          "1 tablespoon Old Bay® seasoning",
          "1 lb jumbo lump crabmeat",
          "½ cup mayonnaise",
          "2 tablespoons dijon mustard",
          "16 ritz crackers, finely crushed",
          "1 lemon, zested and juiced",
          "2 tablespoons minced fresh parsley, plus more for garnish",
          "salt, to taste",
          "pepper, to taste",
          "6 large salmon fillets, skin and bones removed",
          "2 tablespoons minced fresh chives, for garnish"
        ],
        category:"West",
            tags:["Meal","Dinner","Seafood", "Fish", "Seafood", "Dairy", "Shellfish", "Under 1 Hour", "30-60 mins", "Under 15 Minutes", "Meal Prep", "Big Batch","Hard"]
    )

    
]
