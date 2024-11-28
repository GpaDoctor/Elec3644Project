//
//  MenuModel.swift
//  CookingMaster
//
//  Author Name: Cheung Ching Pan (3036101721)
//

import Foundation
import SwiftUI

struct Menu: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var dishID: String
    var date: Date
}

