//
//  RecipeInstructionView.swift
//  CookingMaster
//
//  Author Name: Wong Lok Wang (3035947477)
//

import SwiftUI
import CoreData

struct RecipeInstructionsView: View {
    var recipe: Recipe
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isCookingHistoryEnabled") var isCookingHistoryEnabled: Bool = true
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text("Instructions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                ForEach(recipe.instructions.indices, id: \.self) { index in
                    VStack(alignment: .center, spacing: 10) {
                        Text("Step \(index + 1)")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(recipe.instructions[index])
                            .multilineTextAlignment(.center)
                            .font(.body)
                            .padding(.horizontal)
                    }
                    .padding(.vertical, 10)
                }
                
                // Done Cooking Button
                Button(action: {
                    saveToCookingHistory()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Done Cooking")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.vertical)
                }
            }
        }
        .navigationBarTitle(Text(recipe.title), displayMode: .inline)
    }
    
    // Function to save recipe to cooking history
    private func saveToCookingHistory() {
        if isCookingHistoryEnabled  {
            let cookedRecipe = CookedRecipe(context: viewContext)
            cookedRecipe.id = recipe.id
            cookedRecipe.dateCooked = Date()
            
            // Save the context
            do {
                try viewContext.save()
                print("Recipe saved to cooking history.")
            } catch {
                print("Failed to save recipe to cooking history: \(error.localizedDescription)")
            }
        }
    }
}
    
struct RecipeInstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeInstructionsView(recipe: recipesData[0])
    }
}
