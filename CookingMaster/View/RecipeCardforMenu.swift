//
//  RecipeCardforMenu.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/28/24.
//

import Foundation
import SwiftUI

struct RecipeCardforMenu: View {
   // properties
        var recipe: Recipe
        @State var showModel: Bool = false
        var haptics = UIImpactFeedbackGenerator(style: .heavy)
    
    
        var body: some View {
            HStack{
                // Check if the image is stored in the Documents Directory
                if let loadedImage = PersistenceController.shared.loadImageFromDocuments(fileName: recipe.image) {
                    // Dynamically loaded image from file
                    Image(uiImage: loadedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .cornerRadius(10)
                        .clipped()
                } else if UIImage(named: recipe.image) != nil {
                    // Image from Asset Catalog
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .cornerRadius(10)
                        .clipped()
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
    
    
                VStack(alignment: .leading, spacing: 5){
    
                    Text(recipe.title)
                        .modifier(TitleModifier3())
                        .padding(.bottom,15)
                        .lineLimit(2)
                    HStack{
                        Text("\(recipe.preparation)min")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(5)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.colorGreenAdaptive.opacity(0.3))
                            )
                        Spacer()
                        Button{
    
                        }label: {
                            Image(systemName: "ellipsis")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.colorGreenAdaptive.opacity(0.3))
                                )
                        }
                    }
                }
            }
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        }
    
    }
    struct TitleModifier3: ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.system(.title2, design: .serif))
                .fontWeight(.bold)
                .foregroundColor(.black)
                    .padding(8)
        }
    }
    
        struct RecipSmallCard_Previes: PreviewProvider {
            static var previews: some View{
                RecipeSmallCardView(recipe: recipesData[0])
                    .previewLayout(.sizeThatFits)
    
            }
        }
    
