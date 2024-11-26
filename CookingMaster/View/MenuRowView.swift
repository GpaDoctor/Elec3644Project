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
//            Image(menu.dish.first!.image)
//                .resizable()
//                .scaledToFill()
//                .frame(width: 100, height: 100)
//                .cornerRadius(10)
//                .clipped()
            // Safely unwrap the first recipe's image
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
                    Button{
                        
                    } label:{
                        Text("View")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(5)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.colorGreenAdaptive.opacity(0.3))
                            )
                            
                            
                    }
                }
            }
        }
//        .background(Color.white)
//        .cornerRadius(12)
//        .shadow(color: Color("ColorBlackTransparentLight"), radius: 8, x: 0, y: 0)
    }
}

struct MenuRowView_Previews: PreviewProvider{
    static var previews: some View{
        //MenuView(menus: menuData)
        MenuRowView(menu: menuData[0])
           // .previewLayout(.sizeThatFits)
    }
}
