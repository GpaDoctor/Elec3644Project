//
//  HomeView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//Author Name: Cheung Ching Pan (3036101721)
//


import SwiftUI

struct HomeView: View {
    
    // Properties
    var recipes: [Recipe] = recipesData

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                // Search Bar
                HStack {
                    NavigationLink(destination: SearchView()) {
                        HStack(spacing: 15) {
                            Image(systemName: "magnifyingglass")
                                .font(.title2)
                                .foregroundColor(.gray)
                            
                            Text("Search")
                                .foregroundColor(.primary)
                            
                            Spacer()
                        }
                        .padding(.vertical, 12)
                        .padding(.horizontal)
                        .background(
                            Capsule()
                                .strokeBorder(Color.gray, lineWidth: 0.8)
                                .shadow(radius: 5)
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                .padding()
                .padding(.top, 45)
                
                // Recipe Cards
                Text("New Snack From Chef")
                    .fontWeight(.bold)
                    .modifier(TitleModifier())
                    .padding(.top, 10)
                
                VStack(alignment: .center, spacing: 20) {
                    ForEach(recipes) { item in
                        RecipeCardView(recipe: item)
                        Spacer()
//                        Spacer()
                    }
                }
                .padding(.horizontal)
                
                // Footer
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
            .navigationTitle("Home")
            .navigationBarHidden(true)
        }
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

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(recipes: recipesData)
    }
}
