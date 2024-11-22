//
//  HomeViewModel.swift
//  CookingMaster
//
//  Created by Ching Pan CHEUNG on 11/22/24.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject, Identifiable {
    @Published var searchText: String = ""
    @Published var searchActive: Bool = false
}
