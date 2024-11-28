//
//  AppView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//Author Name: Cheung Ching Pan (3036101721)
//

import Foundation
import SwiftUI

struct AppView: View {
    @State private var selectedTab = 0
    @StateObject private var locationManager = LocationManager()
    @State private var showAddRecipeView = false

    
    var body: some View {
        ZStack{
            TabView (selection: $selectedTab){
                HomeView()
                    .tabItem {
                        Image(selectedTab == 0 ? "Homeselected" : "Home")
                        Text("Home")
                    }
                    .tag(0)
                MenuView()
                    .tabItem {
                        Image(selectedTab == 1 ? "MenuSelected" : "Menu")
                        Text("Menu")
                    }
                    .tag(1)
                MapView()
                    .environmentObject(locationManager)
                    .tabItem {
                        Image(selectedTab == 2 ? "MapSelected" : "Map")
                        Text("Map")
                    }
                    .tag(2)
                ProfileView()
                    .tabItem {
                        Image(selectedTab == 3 ? "ProfileSelected" : "Profile")
                        Text("Profile")
                    }
                    .tag(3)
            }
            .accentColor(.green) // Change the color of text to green
            VStack {
                Spacer()
                HStack (alignment: .center){
                    Button(action: {
                        showAddRecipeView = true
                        print("Floating button tapped!")
                    }) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.colorBlackTransparentDark)
                            .padding()
                            .background(Circle().fill(Color.green))
                            .shadow(radius: 10)
                    }
                }
                .padding(25)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)          .sheet(isPresented: $showAddRecipeView) {
                AddRecipeView()
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
