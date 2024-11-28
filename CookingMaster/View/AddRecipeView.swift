//
//  AddRecipeView.swift
//  CookingMaster
//
//  Author Name: Cheung Ching Pan (3036101721)
//               Cheung Man Hei Kay (303601609)

import SwiftUI
import CoreData

struct AddRecipeView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode

    // Properties for new or editing recipe
    @State private var title: String = ""
    @State private var headline: String = ""
    @State private var chef: String = ""
    @State private var category: String = ""
    @State private var ingredients: [String] = []
    @State private var instructions: [String] = []
    @State private var ingredientInput: String = ""
    @State private var instructionInput: String = ""
    @State private var tags: [String] = []
    @State private var tagInput: String = ""
    @State private var image: UIImage? = nil
    @State private var rating: Int = 0
    @State private var serves: Int = 1
    @State private var preparation: Int = 0
    @State private var cooking: Int = 0

    @State private var showImagePicker = false

    // Editing Recipe (optional)
    var recipeToEdit: Recipe?

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

                // Tags Section
                Section(header: Text("Tags")) {
                    TextField("Add Tag", text: $tagInput, onCommit: {
                        if !tagInput.isEmpty {
                            tags.append(tagInput)
                            tagInput = ""
                        }
                    })
                    List {
                        ForEach(tags, id: \.self) { tag in
                            Text(tag)
                        }
                        .onDelete { indexSet in
                            tags.remove(atOffsets: indexSet)
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
            .navigationTitle(recipeToEdit == nil ? "Add Recipe" : "Update Recipe")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(recipeToEdit == nil ? "Save" : "Update") {
                        saveOrUpdateRecipe()
                    }
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(image: $image)
            }
            .onAppear(perform: loadExistingRecipe)
        }
    }

    // Load existing recipe for editing
    private func loadExistingRecipe() {
        guard let recipe = recipeToEdit else { return }

        title = recipe.title
        headline = recipe.headline
        chef = recipe.chef
        category = recipe.category
        ingredients = recipe.ingredients
        instructions = recipe.instructions
        tags = recipe.tags
        rating = recipe.rating
        serves = recipe.serves
        preparation = recipe.preparation
        cooking = recipe.cooking

        if let savedImage = PersistenceController.shared.loadImageFromDocuments(fileName: recipe.image) {
            image = savedImage
        }
    }

    // Save or Update Recipe
    private func saveOrUpdateRecipe() {
        guard !title.isEmpty, !headline.isEmpty else {
            print("Please provide all required fields.")
            return
        }

        if let existingRecipe = recipeToEdit {
            let updatedRecipe = Recipe(
                id: existingRecipe.id,
                title: title,
                headline: headline,
                image: existingRecipe.image,
                chef: chef,
                rating: rating,
                serves: serves,
                preparation: preparation,
                cooking: cooking,
                instructions: instructions,
                ingredients: ingredients,
                category: category,
                tags: tags
            )
            PersistenceController.shared.updateRecipe(recipe: existingRecipe, updatedDetails: updatedRecipe)
        } else {
            let newRecipe = Recipe(
                id: UUID(),
                title: title,
                headline: headline,
                image: "",
                chef: chef,
                rating: rating,
                serves: serves,
                preparation: preparation,
                cooking: cooking,
                instructions: instructions,
                ingredients: ingredients,
                category: category,
                tags: tags
            )
            if let image = image {
                PersistenceController.shared.saveRecipe(recipe: newRecipe, image: image)
            }
        }

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


