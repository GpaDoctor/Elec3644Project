//
//  MenuData.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI

let menuData: [Menu] = [
    Menu(
        id: UUID(),
        name: "Lunch",
        dishID: [recipesData[0].id, recipesData[1].id],
        date: Date()
        ),
    Menu(
        id:UUID(),
        name: "Date With Jaden",
        dishID: [recipesData[1].id],
        date: Date()
        )
]
