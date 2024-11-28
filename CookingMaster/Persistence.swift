//
//  Persistence.swift
//  CookingMaster
//
//  Author Name: Cheung Ching Pan (3036101721)
//               Cheung Man Hei Kay (3036106109)
//


import CoreData
import UIKit


struct PersistenceController {
    static let shared = PersistenceController()
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CookingMaster")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                print("Core Data error: \(error.localizedDescription)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        // Debugging: Check if the entity exists
        if let entityDescription = NSEntityDescription.entity(forEntityName: "RecipeEntity", in: container.viewContext) {
            print("Entity found: \(entityDescription)")
        } else {
            print("Error: RecipeEntity not found in Core Data model.")
        }
    }
    
    
    @MainActor
    static let preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        for i in 0..<10 {
            let recipe = RecipeEntity(context: viewContext)
            recipe.id = UUID()
            recipe.title = "Sample Recipe \(i)"
            recipe.headline = "Delicious and easy to make!"
            recipe.image = "sample_image.jpg"
            recipe.chef = "Chef \(i)"
            recipe.rating = Int16(5)
            recipe.serves = Int16(4)
            recipe.preparation = Int16(15)
            recipe.cooking = Int16(30)
            recipe.category = "Dessert"
            recipe.ingredients = "Ingredient1,Ingredient2,Ingredient3"
            recipe.instructions = "Step1,Step2,Step3"
        }
        
        do {
            try viewContext.save()
        } catch {
            print("Failed to save preview data: \(error.localizedDescription)")
        }
        return result
    }()
    
    var container: NSPersistentContainer
    
    // MARK: - Fetch Recipes
    func fetchRecipes() -> [Recipe] {
        let context = container.viewContext
        
        // Debugging: Check if the entity exists
        if let entityDescription = NSEntityDescription.entity(forEntityName: "RecipeEntity", in: context) {
            print("Entity found: \(entityDescription)")
        } else {
            fatalError("Error: RecipeEntity not found in Core Data model.")
        }
        
        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        
        do {
            let recipeEntities = try context.fetch(fetchRequest)
            return recipeEntities.map { entity in
                Recipe(
                    id: entity.id ?? UUID(),
                    title: entity.title ?? "",
                    headline: entity.headline ?? "",
                    image: entity.image ?? "",
                    chef: entity.chef ?? "",
                    rating: Int(entity.rating),
                    serves: Int(entity.serves),
                    preparation: Int(entity.preparation),
                    cooking: Int(entity.cooking),
                    instructions: entity.instructions?.components(separatedBy: ",") ?? [],
                    ingredients: entity.ingredients?.components(separatedBy: ",") ?? [],
                    category: entity.category ?? "",
                    tags: entity.tags?.components(separatedBy: ",") ?? []
                )
            }
        } catch {
            print("Failed to fetch recipes: \(error.localizedDescription)")
            return []
        }
    }
    // MARK: - Save Recipe
    func saveRecipe(recipe: Recipe, image: UIImage) {
        let context = container.viewContext
        let newRecipe = RecipeEntity(context: context)
        
        newRecipe.id = recipe.id
        newRecipe.title = recipe.title
        newRecipe.headline = recipe.headline
        newRecipe.image = saveImageToDocuments(image: image)
        newRecipe.chef = recipe.chef
        newRecipe.rating = Int16(recipe.rating)
        newRecipe.serves = Int16(recipe.serves)
        newRecipe.preparation = Int16(recipe.preparation)
        newRecipe.cooking = Int16(recipe.cooking)
        newRecipe.instructions = recipe.instructions.joined(separator: ",")
        newRecipe.ingredients = recipe.ingredients.joined(separator: ",")
        newRecipe.category = recipe.category
        newRecipe.tags = recipe.tags.joined(separator: ",")
        
        do {
            try context.save()
            print("Recipe saved successfully!")
        } catch {
            print("Failed to save recipe: \(error.localizedDescription)")
        }
    }
    
    //MARK: -Update Recipe
    func updateRecipe(recipe: Recipe, updatedDetails: Recipe) {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", recipe.id as CVarArg)
        
        do {
            if let entity = try context.fetch(fetchRequest).first {
                // Update properties
                entity.title = updatedDetails.title
                entity.headline = updatedDetails.headline
                entity.chef = updatedDetails.chef
                entity.rating = Int16(updatedDetails.rating)
                entity.serves = Int16(updatedDetails.serves)
                entity.preparation = Int16(updatedDetails.preparation)
                entity.cooking = Int16(updatedDetails.cooking)
                entity.instructions = updatedDetails.instructions.joined(separator: ",")
                entity.ingredients = updatedDetails.ingredients.joined(separator: ",")
                entity.category = updatedDetails.category
                entity.tags = updatedDetails.tags.joined(separator: ",")
                
                // Save the context
                try context.save()
                print("Recipe updated successfully!")
            } else {
                print("Error: No matching recipe found to update.")
            }
        } catch {
            print("Failed to update recipe: \(error.localizedDescription)")
        }
    }
    // MARK: - Delete Recipe
    func deleteRecipe(_ recipeEntity: RecipeEntity) {
        let context = container.viewContext
        context.delete(recipeEntity)
        
        do {
            try context.save()
            print("Recipe deleted successfully!")
        } catch {
            print("Failed to delete recipe: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Save Image to Documents Directory
    func saveImageToDocuments(image: UIImage) -> String {
        let fileName = UUID().uuidString + ".jpg"
        let fileManager = FileManager.default
        let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = directory.appendingPathComponent(fileName)
        
        if let imageData = image.jpegData(compressionQuality: 0.8) {
            do {
                try imageData.write(to: fileURL)
                print("Image saved to: \(fileURL.path)")
            } catch {
                print("Failed to save image: \(error.localizedDescription)")
            }
        } else {
            print("Failed to convert UIImage to JPEG data")
        }
        
        return fileName
    }
    
    // MARK: - Load Image from Documents Directory
    func loadImageFromDocuments(fileName: String) -> UIImage? {
        let fileManager = FileManager.default
        let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = directory.appendingPathComponent(fileName)
        
        do {
            let data = try Data(contentsOf: fileURL)
            return UIImage(data: data)
        } catch {
            print("Error loading image from documents: \(error.localizedDescription)")
            return nil
        }
    }
    
    // MARK: - Fetch Menus
    func fetchMenus() -> [Menu] {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<MenuEntity> = MenuEntity.fetchRequest()
        
        do {
            let menuEntities = try context.fetch(fetchRequest)
            let allRecipes = fetchRecipes() // Fetch all recipes (static and Core Data)
            
            return menuEntities.map { menuEntity in
                Menu(
                    id: menuEntity.id ?? UUID(),
                    name: menuEntity.name ?? "",
                    dishID: menuEntity.dishid ?? "",
                    date: menuEntity.date ?? Date()
                )
            }
        } catch {
            print("Failed to fetch menus: \(error.localizedDescription)")
            return []
        }
    }
    
    // MARK: - Save Menu
    func saveMenu(menu: Menu) {
        let context = container.viewContext
        let newMenu = MenuEntity(context: context)
        
        newMenu.id = menu.id
        newMenu.name = menu.name
        newMenu.date = menu.date
        newMenu.dishid = menu.dishID
        
        do {
            try context.save()
            print("Menu saved successfully!")
        } catch {
            print("Failed to save menu: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Delete Menu
    func deleteMenu(_ menuEntity: MenuEntity) {
        let context = container.viewContext
        context.delete(menuEntity)
        
        do {
            try context.save()
            print("Menu deleted successfully!")
        } catch {
            print("Failed to delete menu: \(error.localizedDescription)")
        }
    }
}
extension PersistenceController {
    // Update menu date
    func updateMenuDate(menu: Menu, newDate: Date) {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<MenuEntity> = MenuEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", menu.id as CVarArg)

        do {
            if let menuEntity = try context.fetch(fetchRequest).first {
                menuEntity.date = newDate
                try context.save()
                print("Menu date updated successfully!")
            }
        } catch {
            print("Failed to update menu date: \(error.localizedDescription)")
        }
    }
}

extension PersistenceController {
    func deleteRecipeById(_ id: UUID) {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            if let recipeEntity = try context.fetch(fetchRequest).first {
                context.delete(recipeEntity)
                try context.save()
                print("Recipe deleted successfully!")
            } else {
                print("No recipe found with the specified ID.")
            }
        } catch {
            print("Failed to delete recipe: \(error.localizedDescription)")
        }
    }
}
