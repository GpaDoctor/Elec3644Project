






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
                    category: entity.category ?? ""
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

        do {
            try context.save()
            print("Recipe saved successfully!")
        } catch {
            print("Failed to save recipe: \(error.localizedDescription)")
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
        let fileName = UUID().uuidString + ".jpg" // Generate a unique file name
        let fileManager = FileManager.default

        if let data = image.jpegData(compressionQuality: 0.8) {
            let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
                .appendingPathComponent(fileName)

            do {
                try data.write(to: url)
                print("Image saved successfully to \(url.path)")
            } catch {
                print("Failed to save image: \(error.localizedDescription)")
            }
        }
        return fileName
    }

    // MARK: - Load Image from Documents Directory
    func loadImageFromDocuments(fileName: String) -> UIImage? {
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent(fileName)

        if let data = try? Data(contentsOf: url) {
            return UIImage(data: data)
        }
        return nil
    }
}
