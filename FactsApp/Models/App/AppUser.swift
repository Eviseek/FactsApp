//
//  AppUser.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 01.05.2025.
//

import Foundation

struct AppUser {
    var id: String
    var name: String
    var imageUrl: String?
    var favoriteFacts: [AppFact]
    var favoriteCategories: [FactCategory] = [FactCategory]()
}
