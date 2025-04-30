//
//  User.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id: String
    var name: String
    var imageUrl: String?
    var favoriteFacts: [String] //pole se facts ids
    var favoriteCategories: [String] = [String]() //empty = any
}
