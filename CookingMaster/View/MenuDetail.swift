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
            VStack {
                Text(menu.name) // Display menu name
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            .navigationTitle("Menu Details") // Set the navigation title
        }
}
