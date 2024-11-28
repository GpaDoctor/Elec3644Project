
//Author Name: Cheung Ching Pan (3036101721)

import SwiftUI
import CoreData

struct ProfileView: View {
    @AppStorage("accountName") var accountName: String = "GpaDoctor"
    @AppStorage("profileImageData") var profileImageData: Data?

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "gearshape")
                            .font(.title)
                    }
                }
                .padding()

                VStack {
                    if let imageData = profileImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    } else {
                        Image("profile_placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                    }

                    Text(accountName)
                        .font(.title)
                        .fontWeight(.bold)

                                    NavigationLink(destination: LikedView()) {
                                            HStack {
                                                Image(systemName: "heart.fill")
                                                    .foregroundColor(.red)
                                                Text("Liked")
                                                    .font(.headline)
                                            }
                                            .padding()
                                        }
                    
                                        NavigationLink(destination: CookingHistoryView()) {
                                            HStack {
                                                Image(systemName: "flame.fill")
                                                    .foregroundColor(.orange)
                                                Text("Cooking History")
                                                    .font(.headline)
                                            }
                                            .padding()
                                        }
                    

                    Text("My Recipes")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)

                    // Updated RecipeGridView
                    RecipeGridView()
                }
                .padding()

                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct RecipeGridView: View {
    @FetchRequest(
            entity: RecipeEntity.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \RecipeEntity.title, ascending: true)]
        ) var fetchedRecipes: FetchedResults<RecipeEntity>
    var allRecipes: [Recipe] = recipesData // Use your actual data source

    var myRecipes: [Recipe] {
        allRecipes.filter { $0.chef == "GpaDoctor" }
    }

    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]

    var body: some View {
        ScrollView {
            if fetchedRecipes.isEmpty {
                // Display a message if no recipes are available
                Text("You haven't added any recipes yet.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                // Display recipes from Core Data in a grid
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(fetchedRecipes, id: \.id) { recipeEntity in
                        NavigationLink(destination: MyRecipeDetailView(recipe: mapRecipeEntityToRecipe(recipeEntity))) {
                            RecipeGridItem(recipe: mapRecipeEntityToRecipe(recipeEntity))
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        .frame(height: 150)
                    }
                }
                
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
                category: entity.category ?? "",
                tags: entity.tags?.components(separatedBy: ",") ?? []
            )
        }

}
struct RecipeGridItem: View {
    var recipe: Recipe

    var body: some View {
        VStack {
            if let loadedImage = PersistenceController.shared.loadImageFromDocuments(fileName: recipe.image) {
                // Dynamically loaded image from file
                Image(uiImage: loadedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 25, height: 150)
                    .clipped()
                    .cornerRadius(10)
            } else if UIImage(named: recipe.image) != nil {
                // Image from Asset Catalog
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 25, height: 150)
                    .clipped()
                    .cornerRadius(10)
            } else {
                // Fallback if no image is found
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 110, height: 110)
                    .cornerRadius(10)
                    .overlay(
                        Text("No Image")
                            .font(.caption)
                            .foregroundColor(.white)
                    )
            }

        }
    }
}

