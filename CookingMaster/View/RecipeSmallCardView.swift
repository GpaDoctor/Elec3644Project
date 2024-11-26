//
//  RecipeSmallCardView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/26/24.
//

import Foundation
import SwiftUI

struct RecipeSmallCardView: View {
    //properties
    var recipe: Recipe
    @State var showModel: Bool = false
    var haptics = UIImpactFeedbackGenerator(style: .heavy)

    
    var body: some View {
        HStack{
            Image(recipe.image)
                .resizable()
                .scaledToFill()
                .frame(width: 110, height: 110)
                .cornerRadius(10)
                .clipped()
            
            
            VStack(alignment: .leading, spacing: 5){
                
                Text(recipe.title )
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.bottom,15)
                HStack{
                    Text("\(recipe.preparation)min")
                        .font(.title3)
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
            .onTapGesture {
                haptics.impactOccurred()
                self.showModel = true
            }
            .sheet(isPresented: $showModel) {
                RecipeDetail(recipe: recipe)
            }
        }
    }

    
    struct RecipSmallCard_Previes: PreviewProvider {
        static var previews: some View{
            RecipeSmallCardView(recipe: recipesData[0])
                .previewLayout(.sizeThatFits)
            
        }
    }

