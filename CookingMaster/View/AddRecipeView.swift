//
//  AddRecipeView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/27/24.
//

import SwiftUI
import CoreData

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    @State private var title: String = ""
    @State private var headline: String = ""
    @State private var chef: String = ""
    @State private var category: String = ""
    @State private var ingredients: [String] = []
    @State private var instructions: [String] = []
    @State private var ingredientInput: String = ""
    @State private var instructionInput: String = ""
    @State private var image: UIImage? = nil
    @State private var rating: Int = 0
    @State private var serves: Int = 1
    @State private var preparation: Int = 0
    @State private var cooking: Int = 0

    @State private var showImagePicker = false

    var body: some View {
        NavigationStack {
            Form {
                // Recipe Image Section
                Section(header: Text("Recipe Photo")) {
                    if let image = image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(12)
                            .onTapGesture {
                                showImagePicker = true
                            }
                    } else {
                        Button("Upload Photo") {
                            showImagePicker = true
                        }
                    }
                }

                // Recipe Details Section
                Section(header: Text("Recipe Details")) {
                    TextField("Title", text: $title)
                    TextField("Headline", text: $headline)
                    TextField("Chef", text: $chef)
                    TextField("Category", text: $category)
                }

                // Ingredients Section
                Section(header: Text("Ingredients")) {
                    TextField("Add Ingredient", text: $ingredientInput, onCommit: {
                        if !ingredientInput.isEmpty {
                            ingredients.append(ingredientInput)
                            ingredientInput = ""
                        }
                    })
                    List {
                        ForEach(ingredients, id: \.self) { ingredient in
                            Text(ingredient)
                        }
                        .onDelete { indexSet in
                            ingredients.remove(atOffsets: indexSet)
                        }
                    }
                }

                // Instructions Section
                Section(header: Text("Instructions")) {
                    TextField("Add Instruction", text: $instructionInput, onCommit: {
                        if !instructionInput.isEmpty {
                            instructions.append(instructionInput)
                            instructionInput = ""
                        }
                    })
                    List {
                        ForEach(instructions, id: \.self) { instruction in
                            Text(instruction)
                        }
                        .onDelete { indexSet in
                            instructions.remove(atOffsets: indexSet)
                        }
                    }
                }

                // Recipe Metadata Section
                Section(header: Text("Metadata")) {
                    Stepper(value: $rating, in: 1...5) {
                        Text("Rating: \(rating)")
                    }
                    Stepper(value: $serves, in: 1...20) {
                        Text("Serves: \(serves)")
                    }
                    Stepper(value: $preparation, in: 0...120) {
                        Text("Preparation Time: \(preparation) mins")
                    }
                    Stepper(value: $cooking, in: 0...240) {
                        Text("Cooking Time: \(cooking) mins")
                    }
                }
            }
            .navigationTitle("Add Recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveRecipe()
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $image)
            }
        }
    }

    // Save Recipe to Core Data
    private func saveRecipe() {
        guard !title.isEmpty, !headline.isEmpty, let image = image else {
            print("Please provide all required fields.")
            return
        }

        // Create a new Recipe object
        let newRecipe = Recipe(
            id: UUID(),
            title: title,
            headline: headline,
            image: "", // Placeholder, the file name will be set below
            chef: chef,
            rating: rating,
            serves: serves,
            preparation: preparation,
            cooking: cooking,
            instructions: instructions,
            ingredients: ingredients,
            category: category,
            tags: []
        )

        // Save the recipe and the image to Core Data
        PersistenceController.shared.saveRecipe(recipe: newRecipe, image: image)
        presentationMode.wrappedValue.dismiss()
    }
}
struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let persistenceController = PersistenceController.shared

        AddRecipeView()
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
    }
}
