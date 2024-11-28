//
//  RecipeSmallCardView.swift
//  CookingMaster
//
//  Author Name: Cheung Ching Pan (3036101721)
//


import SwiftUI

struct RecipeSmallCardView: View {
    var recipe: Recipe
    var haptics = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
            HStack {
                // Image loading code
                if let loadedImage = PersistenceController.shared.loadImageFromDocuments(fileName: recipe.image) {
                    Image(uiImage: loadedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .cornerRadius(10)
                        .clipped()
                } else if UIImage(named: recipe.image) != nil {
                    Image(recipe.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 110, height: 110)
                        .cornerRadius(10)
                        .clipped()
                } else {
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
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(recipe.title)
                        .modifier(TitleModifier2())
                        .padding(.bottom, 15)
                        .lineLimit(2)
                    HStack {
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
                        Button {
                            // Action for ellipsis button
                        } label: {
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
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
        }
        .buttonStyle(PlainButtonStyle())
        .onTapGesture {
            haptics.impactOccurred()
        }
    }
}

struct TitleModifier2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(.title2, design: .serif))
            .fontWeight(.bold)
            .foregroundColor(.black)
            .padding(8)
    }
}

struct RecipeSmallCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSmallCardView(recipe: recipesData[0])
            .previewLayout(.sizeThatFits)
    }
}
