//
//  MenuRowView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI
import CoreData

struct MenuRowView: View {
    var menu: Menu
    var recipes: [Recipe]
    @State var date = Date()
    @State private var showCalendar = false // Show or hide calendar picker
    @FetchRequest(
            entity: RecipeEntity.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \RecipeEntity.title, ascending: true)]
        ) var fetchedRecipes: FetchedResults<RecipeEntity>
        
    init(menu: Menu, recipes: [Recipe]) {
            self.menu = menu
            self.recipes = recipes
            _date = State(initialValue: menu.date) 
        }
    var body: some View {
        
        HStack{
            let uuidStrings = menu.dishID.split(separator: ",").map(String.init)
            let uuidArray = uuidStrings.compactMap(UUID.init)

            if let firstDishID = uuidArray.first {
                if let recipe = recipes.first(where: { $0.id.uuidString == firstDishID.uuidString }) {
                    // Recipe is from recipesData
                    if UIImage(named: recipe.image) != nil {
                        // Image from Asset Catalog
                        Image(recipe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 110)
                            .cornerRadius(10)
                            .clipped()
                    } else {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .overlay(
                                Text("No Image")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            )
                    }
                } else if let recipeEntity = fetchedRecipes.first(where: { $0.id?.uuidString == firstDishID.uuidString }),
                          let imageName = recipeEntity.image, !imageName.isEmpty {
                    if let loadedImage = PersistenceController.shared.loadImageFromDocuments(fileName: imageName) {
                        // Dynamically loaded image from file
                        Image(uiImage: loadedImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 110, height: 110)
                            .cornerRadius(10)
                            .clipped()
                    } else {
                        Rectangle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .overlay(
                                Text("No Image")
                                    .font(.caption)
                                    .foregroundColor(.white)
                            )
                    }
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                        .overlay(
                            Text("No Image")
                                .font(.caption)
                                .foregroundColor(.white)
                        )
                }
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .overlay(
                        Text("No Recipe")
                            .font(.caption)
                            .foregroundColor(.white)
                    )
            }
            
            VStack(alignment: .leading, spacing: 5){
                Text(menu.name)
                    .font(.system(.title3, design: .serif))
                    .padding(.bottom,15)
                HStack{
                    DatePicker("Date",
                               selection: $date,
                               displayedComponents: [.date]
                    )
                    .datePickerStyle(CompactDatePickerStyle())
                    .font(.title3)
                    .labelsHidden()
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.colorGreenAdaptive.opacity(0.3))
                    )
                    .padding(.vertical, 10)
                    .onChange(of: date) { newDate in
                                            saveDate(newDate: newDate)
                                        }
                    Spacer()
                }
            }
        }
    }
    // MARK: - Save Updated Date to Core Data
        private func saveDate(newDate: Date) {
            PersistenceController.shared.updateMenuDate(menu: menu, newDate: newDate)
        }
}

struct MenuRowView_Previews: PreviewProvider{
    static var previews: some View{
        MenuRowView(menu: menuData[0], recipes: recipesData)
    }
}
