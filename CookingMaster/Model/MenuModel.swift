//
//  MenuModel.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/25/24.
//

import Foundation
import SwiftUI

struct Menu: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var dishID: [UUID]
    var date: Date
}
//    var dish: [Recipe]{
//        dishID.compactMap{dishIDs in
//            recipesData.first{$0.id == dishIDs}
//        }
//    }
//    // Conformance to `Hashable`
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//    
//    static func == (lhs: Menu, rhs: Menu) -> Bool {
//        lhs.id == rhs.id
//    }
//}
