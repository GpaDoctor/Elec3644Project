//
//  AppView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI

struct AppView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView (selection: $selectedTab){
            HomeView()
                .tabItem {
                    Image(selectedTab == 0 ? "Homeselected" : "Home")
                    Text("Home")
                }
                .tag(0)
            MenuView(menus: menuData)
                .tabItem {
                    Image(selectedTab == 1 ? "MenuSelected" : "Menu")
                    Text("Menu")
                }
                .tag(1)
            MapView()
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

    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
