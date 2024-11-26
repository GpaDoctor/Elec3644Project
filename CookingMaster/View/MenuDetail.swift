//
//  MenuDetail.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI


struct MenuDetial: View {
    var menu: Menu // Accept a Menu object
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack {
                //title
                Text(menu.name)
                    .font(.system(.title, design: .serif))
                
                //recipe list
                VStack(alignment:.center,spacing: 20){
                    ForEach(menu.dish){ dish in
                        RecipeSmallCardView(recipe:dish)
                    }
                }
                .frame(maxWidth: 640)
                .padding(.horizontal)
                
                Text("Shopping List")
                    .font(.system(.title, design: .serif))
                
                VStack(alignment:.center,spacing: 20){
                    ForEach(menu.dish){ dish in
                        ForEach(dish.ingredients, id:\.self){item in
                            VStack(alignment: .leading, spacing: 5) {
                                Text(item)
                                    .font(.footnote)
                                    .multilineTextAlignment(.leading)
                                Divider()
                            }
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
                //.navigationTitle(menu.name) // Set the navigation title
            }
        }
    }
}
struct MenuDetail_Previews: PreviewProvider{
    static var previews: some View {
        MenuDetial(menu: menuData[0])
    }
}
