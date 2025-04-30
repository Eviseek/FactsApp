//
//  FactCategory.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import Foundation

struct FactCategory: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    var title: String
}

struct FactCategoryList {
    static let sampleList: [FactCategory] = [
        FactCategory(title: "Historie"),
        FactCategory(title: "Architektura"),
        FactCategory(title: "Kultura"),
        FactCategory(title: "Věda"),
        FactCategory(title: "Geografie")
    ]
}
