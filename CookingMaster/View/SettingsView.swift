////
////  SettingsView.swift
////  CookingMaster
////
////  Created by Lawrence on 28/11/2024.
////
//
//import SwiftUI
//import CoreData // Added import statement
//
//struct SettingsView: View {
//    // Account name stored in UserDefaults
//    @AppStorage("accountName") var accountName: String = "GpaDoctor"
//    
//    // Profile image data stored in UserDefaults
//    @AppStorage("profileImageData") var profileImageData: Data?
//    
//    // Cooking history toggle
//    @AppStorage("isCookingHistoryEnabled") var isCookingHistoryEnabled: Bool = true
//    
//    @Environment(\.managedObjectContext) private var viewContext
//
//    // Previous account name to detect changes
//    @State private var previousAccountName: String = ""
//    
//    // Image picker properties
//    @State private var showImagePicker: Bool = false
//    @State private var inputImage: UIImage?
//    
//    var body: some View {
//        Form {
//            // Account Name Section
//            Section(header: Text("Account Name")) {
//                TextField("Enter your name", text: $accountName)
//            }
//            
//            // Profile Picture Section
//            Section(header: Text("Profile Picture")) {
//                HStack {
//                    Spacer()
//                    if let imageData = profileImageData, let uiImage = UIImage(data: imageData) {
//                        Image(uiImage: uiImage)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 150, height: 150)
//                            .clipShape(Circle())
//                            .onTapGesture {
//                                showImagePicker = true
//                            }
//                    } else {
//                        Image("profile_placeholder")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 150, height: 150)
//                            .clipShape(Circle())
//                            .onTapGesture {
//                                showImagePicker = true
//                            }
//                    }
//                    Spacer()
//                }
//            }
//            
//            // Cooking History Toggle
//            Section {
//                Toggle(isOn: $isCookingHistoryEnabled) {
//                    Text("Record Cooking History")
//                }
//            }
//        }
//        .onAppear {
//            previousAccountName = accountName
//        }
//
//        // On change of account name, update recipes
//        .onChange(of: accountName) { newValue in
//            updateRecipesChefName(from: previousAccountName, to: newValue)
//            previousAccountName = newValue
//        }
//        .navigationTitle("Settings")
//        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
//            ImagePicker(image: $inputImage)
//        }
//    }
//
//    func updateRecipesChefName(from oldName: String, to newName: String) {
//        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "chef == %@", oldName)
//
//        do {
//            let recipes = try viewContext.fetch(fetchRequest)
//            for recipe in recipes {
//                recipe.chef = newName
//            }
//            try viewContext.save()
//        } catch {
//            print("Error updating recipes: \(error)")
//        }
//    }
//
//    func loadImage() {
//        guard let inputImage = inputImage else { return }
//        if let imageData = inputImage.jpegData(compressionQuality: 0.8) {
//            self.profileImageData = imageData
//        }
//    }
//}
import SwiftUI
import CoreData

struct SettingsView: View {
    // Account name stored in UserDefaults
    @AppStorage("accountName") var accountName: String = "GpaDoctor"
    
    // Profile image data stored in UserDefaults
    @AppStorage("profileImageData") var profileImageData: Data?
    
    // Cooking history toggle
    @AppStorage("isCookingHistoryEnabled") var isCookingHistoryEnabled: Bool = true
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    // Previous account name to detect changes
    @State private var previousAccountName: String = ""
    
    // Image picker properties
    @State private var showImagePicker: Bool = false
    @State private var inputImage: UIImage?
    
    // Environment toggle
    @State private var isDarkMode: Bool = false
    
    var body: some View {
        Form {
            // Account Name Section
            Section(header: Text("Account Name")) {
                TextField("Enter your name", text: $accountName)
            }
            
            // Profile Picture Section
            Section(header: Text("Profile Picture")) {
                HStack {
                    Spacer()
                    if let imageData = profileImageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .onTapGesture {
                                showImagePicker = true
                            }
                    } else {
                        Image("profile_placeholder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .onTapGesture {
                                showImagePicker = true
                            }
                    }
                    Spacer()
                }
            }
            
            // Cooking History Toggle
            Section {
                Toggle(isOn: $isCookingHistoryEnabled) {
                    Text("Record Cooking History")
                }
            }
            
            // Environment Toggle
            Section {
                Toggle(isOn: $isDarkMode) {
                    Text("Dark Mode")
                }
                .onChange(of: isDarkMode) { value in
                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = value ? .dark : .light
                }
            }
        }
        .onAppear {
            previousAccountName = accountName
            isDarkMode = colorScheme == .dark
        }

        // On change of account name, update recipes
        .onChange(of: accountName) { newValue in
            updateRecipesChefName(from: previousAccountName, to: newValue)
            previousAccountName = newValue
        }
        .navigationTitle("Settings")
        .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
    }

    func updateRecipesChefName(from oldName: String, to newName: String) {
        let fetchRequest: NSFetchRequest<RecipeEntity> = RecipeEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "chef == %@", oldName)

        do {
            let recipes = try viewContext.fetch(fetchRequest)
            for recipe in recipes {
                recipe.chef = newName
            }
            try viewContext.save()
        } catch {
            print("Error updating recipes: \(error)")
        }
    }

    func loadImage() {
        guard let inputImage = inputImage else { return }
        if let imageData = inputImage.jpegData(compressionQuality: 0.8) {
            self.profileImageData = imageData
        }
    }
}
