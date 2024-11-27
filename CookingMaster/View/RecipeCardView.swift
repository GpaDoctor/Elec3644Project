//
//  RecipeCardView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//
//
//import Foundation
//import SwiftUI
//
//struct RecipeCardView: View {
//    //properties
//    let recipe: Recipe
//    var haptics = UIImpactFeedbackGenerator(style: .heavy)
//    @State private var showModel: Bool = false
//    
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            
//            // Card Image
//            Image(recipe.image)
//                .resizable()
//                .scaledToFill()
//                //.scaledToFill()
//                .frame( height: 250)
//                    .clipped()
//  //                  .foregroundStyle(.tint)
//                .overlay(
//                    HStack {
//                        Spacer()
//                        VStack {
//                            Image(systemName: "bookmark")
//                                .font(Font.title.weight(.light))
//                                .foregroundColor(.white)
//                                .imageScale(.small)
//                                .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
//                                .padding(.trailing, 20)
//                                .padding(.top, 22)
//                            
//                            Spacer()
//                        }
//                    }
//                )
//            
//            
//            VStack(alignment: .leading, spacing: 12) {
//                
//                // Title
//                Text(recipe.title)
//                    .font(.system(.title2, design: .serif))
//                    .fontWeight(.bold)
//                    //.foregroundColor(Color("ColorGreenMedium"))
//                    .lineLimit(2)
//                
//                // Headline
//                Text(recipe.headline)
//                    .font(.system(.body, design: .serif))
//                    .foregroundColor(.gray)
//                    .italic()
//                
//                // Rates
//                RecipeStarView(recipe: recipe)
//                
//                
//                // Cooking
//                RecipeCookingView(recipe: recipe)
//                
//            }
//            .padding()
//            
//            .padding(.bottom, 12)
//        }
//        
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
//        .onTapGesture {
//            haptics.impactOccurred()
//            self.showModel = true
//        }
//        .sheet(isPresented: $showModel){
//            RecipeDetailView(recipe: recipe)
//        }
//
////        .sheet(isPresented: $showModal) {
////            RecipeDetailView(recipe: recipe)
////        }
//    }
//}
//
////generate preview
//struct RecipeCardView_Previews: PreviewProvider {
//    static var previews: some View {
////        RecipeCardView(recipe: recipesData[0])
////            .previewLayout(.sizeThatFits)
//        HomeView(
//            recipes: recipesData
//        )
//    }
//}
//

import SwiftUI

struct RecipeCardView: View {
    // Properties
    let recipe: Recipe
    var haptics = UIImpactFeedbackGenerator(style: .heavy)

    var body: some View {
        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
            VStack(alignment: .leading, spacing: 0) {
                // Card Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .clipped()
                    .overlay(
                        HStack {
                            Spacer()
                            VStack {
                                Image(systemName: "bookmark")
                                    .font(Font.title.weight(.light))
                                    .foregroundColor(.white)
                                    .imageScale(.small)
                                    .shadow(color: Color("ColorBlackTransparentLight"), radius: 2, x: 0, y: 0)
                                    .padding(.trailing, 20)
                                    .padding(.top, 22)
                                Spacer()
                            }
                        }
                    )

                VStack(alignment: .leading, spacing: 12) {
                    // Title
                    Text(recipe.title)
                        .modifier(TitleModifier1())
                        .lineLimit(2)

                    // Headline
                    Text(recipe.headline)
                        .font(.system(.body, design: .serif))
                        .foregroundColor(.gray)
                        .italic()

                    // Rates
                    RecipeStarView(recipe: recipe)

                    // Cooking
                    RecipeCookingView(recipe: recipe)
                }
                .padding()
                .padding(.bottom, 12)
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        }
        .buttonStyle(PlainButtonStyle()) // Prevents default button styling
        .simultaneousGesture(
            TapGesture().onEnded {
                haptics.impactOccurred()
            }
        )
    }
}
struct TitleModifier1: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title2, design: .serif))
            .fontWeight(.bold)
            .foregroundColor(.black)
                .padding(8)
    }
}
// Generate preview
struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
