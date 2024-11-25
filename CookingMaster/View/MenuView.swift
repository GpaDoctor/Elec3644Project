//
//  MenuView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI


struct MenuView: View {
    var menus: [Menu]
    @State private var selectedMenu: Menu?
    @State var showMenu: Bool = false

    
    var body: some View {
            NavigationStack {
                
                List(menus) { menu in
                    NavigationLink(destination: MenuDetial(menu: menu)) { // Navigate to details if needed
                        MenuRowView(menu: menu)
                            .padding(.vertical, 5) // Add spacing between rows
                    }
                    .listRowBackground(Color.clear)
                }
                .navigationTitle("Menus")
                .toolbar {
                                ToolbarItem(placement: .topBarTrailing){
                                    Button(action:{
                                        showMenu = true
                                    }){
                                        Image("greenplus")
                                    }
                                }
                            }

            }
        }
    private func addMenue(){
        //add menu function
    }
}

struct MenuView_Preview: PreviewProvider {
    static var previews: some View {
        MenuView(menus: menuData)
    }
}
