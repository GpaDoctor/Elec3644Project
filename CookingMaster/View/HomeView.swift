//
//  HomeView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    //properties
    var recipes: [Recipe] = recipesData

    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            //search bar
            HStack{
                HStack(spacing: 15){
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundStyle(Color.gray)
                    
                    TextField("Search", text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.gray, lineWidth: 0.8)
                        .shadow(radius: 5)
                )
                Button{
                    
                } label:{
                    Image("Filter")
                        .resizable()
                        .scaledToFit()
                        .frame(width:20, height: 25)
                        .padding(7)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white) // Background color
                                .shadow(color: Color("ColorBlackTransparentLight"),radius: 5)
                        )
                        
                }
            }
            .padding()
            .padding(.top,45)
            
                    
            //Recipe Cards
            Text("New Snack Form Chef")
                .fontWeight(.bold)
                .modifier(TitleModifier())
            
            VStack(alignment: .center, spacing: 20) {
                ForEach(recipes) { item in
                    RecipeCardView(recipe: item)
                }
            }
            //.frame(maxWidth: 640)
            .padding(.horizontal)
            
            //Footer
            VStack(alignment: .center, spacing: 20) {
                Text("Jaden is A Handsome Boy")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                
                Text("Maybe you don't believe it but it is a fact.")
                    .font(.system(.body, design: .serif))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .frame(minHeight: 60)
            }
            .frame(maxWidth: 640)
            .padding()
            .padding(.bottom, 85)
            
        }
        .edgesIgnoringSafeArea(.all)
        .padding(0)


    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title, design: .serif))
                .foregroundColor(Color("ColorGreenAdaptive"))
                .padding(8)
    }
}

//MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(
            //headers: headersData,
            //facts: factsData,
            recipes: recipesData
        )
    }
}
