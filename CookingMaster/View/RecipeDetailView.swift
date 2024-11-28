//
//  RecipeDetailView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/26/24.
//
import SwiftUI

struct RecipeDetailView: View {
    // Properties
    var recipe: Recipe
    @State private var pulsate: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @State private var showUpdateView = false
    
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 0) {
                if let loadedImage = PersistenceController.shared.loadImageFromDocuments(fileName: recipe.image) {
                    // Dynamically loaded image from file
                    Image(uiImage: loadedImage)
                        .resizable()
                        .scaledToFit()
                } else if UIImage(named: recipe.image) != nil {
                    // Image from Asset Catalog
                    Image(recipe.image)
                        .resizable()
                        .scaledToFit()
                } else {
                    // Fallback if no image is found
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                        .overlay(
                            Text("No Image")
                                .font(.caption)
                                .foregroundColor(.white)
                        )
                }
                
                Group {
                    // Title
                    Text(recipe.title)
                        .font(.system(.largeTitle, design: .serif))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("ColorGreenAdaptive"))
                        .padding(.top, 10)
                    
                    // Rating
                    RecipeStarView(recipe: recipe)
                    
                    // Cooking Info
                    RecipeCookingView(recipe: recipe)
                    
                    // Ingredients
                    Text("Ingredients")
                        .fontWeight(.bold)
                        .modifier(TitleModifier())
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(recipe.ingredients, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                    
                    // Start Cooking Button
                    NavigationLink(destination: RecipeInstructionsView(recipe: recipe)) {
                        Text("Start Cooking")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                            .padding(.top, 20)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        .overlay(
            VStack {
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left.circle.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .opacity(pulsate ? 1 : 0.6)
                            .scaleEffect(pulsate ? 1.2 : 0.8, anchor: .center)
                            .animation(
                                Animation.easeInOut(duration: 1.5)
                                    .repeatForever(autoreverses: true),
        /*            */            value: pulsate
                            )
                    }
                    .padding(.trailing,20)
                    .padding(.top, 24)
                    Spacer()
                    Button {
                        showUpdateView = true
                    } label: {
                        Image(systemName: "pencil")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .shadow(radius: 4)
                            .opacity(pulsate ? 1 : 0.6)
                    }
                    
                    
                }
                .padding(.horizontal,10)
                Spacer()
            }
        )
        .onAppear {
            self.pulsate.toggle()
        }
        .sheet(isPresented: $showUpdateView) {
                        AddRecipeView(
                            recipeToEdit: recipe // Pass the recipe to be updated
                        )
                    }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recipe: recipesData[0])
    }
}
