
import Foundation
import SwiftUI


struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Button(action: {
                        // Action for settings button
                    }) {
                        Image(systemName: "gearshape")
                            .font(.title)
                    }
                }
                .padding()

                VStack {
                    Image("profile_picture")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)

                    Text("GpaDoctor")
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



//struct RecipeGridItem: View {
//    var recipe: Recipe
//
//    var body: some View {
//        GeometryReader { geometry in
//            Image(recipe.image)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: geometry.size.width, height: 150)
//                .clipped()
//                .cornerRadius(10)
//        }
//        .frame(height: 150)
//    }
//}


struct RecipeGridView: View {
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
            if myRecipes.isEmpty {
                Text("You haven't added any recipes yet.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(myRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeGridItem(recipe: recipe)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .frame(height: 150)
                    }
                }
                .padding(.horizontal, 15)
            }
        }
    }
}
