//
//  MenuRowView.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI

struct MenuRowView: View {
    var menu: Menu

    @State var date = Date()
    @State private var showCalendar = false // Show or hide calendar picker
    
    var body: some View {
        HStack{
                        if let firstRecipe = menu.dish.first {
                            Image(firstRecipe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                                .clipped()
                        } else {
                            // Fallback UI for menus with no recipes
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
            
            VStack(alignment: .leading, spacing: 5){
                Text(menu.name)
                    .font(.title3)
                    .fontWeight(.bold)
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
                    Spacer()
                }
            }
        }
    }
}

struct MenuRowView_Previews: PreviewProvider{
    static var previews: some View{
        //MenuView(menus: menuData)
        MenuRowView(menu: menuData[0])
           // .previewLayout(.sizeThatFits)
    }
}
