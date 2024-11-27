//
//  ContentView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \RecipeEntity.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<RecipeEntity>
    
    var body: some View {
//        ZStack{
//            Color.colorGreenMedium
//                .ignoresSafeArea()
//            Text("Cooking Master")
//                .font(.system(size:30))
//                .fontWeight(.heavy)
//                .foregroundColor(Color(hue: 0.001, saturation: 0.589, brightness: 0.235))
                
                
//        }
        Text("Hello world")
    }
    
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
