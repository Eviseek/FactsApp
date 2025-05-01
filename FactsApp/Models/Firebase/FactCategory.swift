//
//  FactCategory.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import Foundation
import FirebaseFirestore

struct FactCategory: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    var title: String
}

extension FactCategory {
    static let sampleList: [FactCategory] = [
        FactCategory(id: "history", title: "Historie"),
        FactCategory(id: "architecture", title: "Architektura"),
        FactCategory(id: "culture", title: "Kultura"),
        FactCategory(id: "science", title: "Věda"),
        FactCategory(id: "geography", title: "Geografie")
    ]

    var safeId: String {
        guard let id = id else {
            fatalError("Category has no ID — this should never happen.")
        }
        return id
    }
}
