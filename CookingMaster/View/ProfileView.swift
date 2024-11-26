////
////  ProfileView.swift
////  CookingMaster
////
////  Created by Ching Pan CHEUNG on 11/25/24.
////
//
//
import Foundation
import SwiftUI

//struct ProfileView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                HStack {
//                    Text("Profile")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                    Spacer()
//                    Button(action: {
//                        // Action for settings button
//                    }) {
//                        Image(systemName: "gearshape")
//                            .font(.title)
//                    }
//                }
//                .padding()
//                
//                VStack {
//                    Image("profile_picture")
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 150, height: 150)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
//                        .shadow(radius: 10)
//                    
//                    Text("GpaDoctor")
//                        .font(.title)
//                        .fontWeight(.bold)
//                    
//                    NavigationLink(destination: LikedView()) {
//                        HStack {
//                            Image(systemName: "heart.fill")
//                                .foregroundColor(.red)
//                            Text("Liked")
//                                .font(.headline)
//                        }
//                        .padding()
//                    }
//                    
//                    NavigationLink(destination: CookingHistoryView()) {
//                        HStack {
//                            Image(systemName: "flame.fill")
//                                .foregroundColor(.orange)
//                            Text("Cooking History")
//                                .font(.headline)
//                        }
//                        .padding()
//                    }
//                    
//                    Text("My Recipes")
//                        .font(.title2)
//                        .fontWeight(.bold)
//                        .padding(.top)
//                    
//                    RecipeGridView()
//                }
//                .padding()
//                
//                Spacer()
//            }
//            .navigationBarHidden(true)
//        }
//    }
//}
//
//struct RecipeGridView: View {
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
//    
//    var body: some View {
//        ScrollView {
//            LazyVGrid(columns: columns, spacing: 10) {
//                ForEach(1..<10) { index in
//                    NavigationLink(destination: RecipeDetailView(recipeIndex: index)) {
//                        Image("recipe\(index)")
//                            .resizable()
//                            .aspectRatio(contentMode: .fill)
//                            .frame(width: 100, height: 100)
//                            .clipped()
//                    }
//                }
//            }
//            .padding()
//        }
//    }
//}
//
//struct RecipeDetailView: View {
//    let recipeIndex: Int
//    
//    var body: some View {
//        Text("Recipe Details for Recipe \(recipeIndex)")
//            .font(.largeTitle)
//    }
//}
//
//
//struct ProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileView()
//    }
//}

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

struct RecipeGridView: View {
    // Access to all recipes
    var allRecipes: [Recipe] = recipesData // Use your actual data source

    // Filtered recipes where chef is GpaDoctor
    var myRecipes: [Recipe] {
        allRecipes.filter { $0.chef == "GpaDoctor" }
    }

    // Grid columns
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView {
            if myRecipes.isEmpty {
                Text("You haven't added any recipes yet.")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(myRecipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeGridItem(recipe: recipe)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
