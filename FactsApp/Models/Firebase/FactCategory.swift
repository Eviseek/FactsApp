//
//  FactCategory.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import Foundation
import FirebaseFirestore

struct FactCategory: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    var title: String
    
    // Category cannot be saved to database without ID, so it's not possible to not get an ID when fetching it
    var id: String {
        guard let id = uid else { fatalError("Category has no ID — this should never happen.") }
        return id
    }
}

extension FactCategory {
    static let sampleList: [FactCategory] = [
        FactCategory(uid: "history", title: "Historie"),
        FactCategory(uid: "architecture", title: "Architektura"),
        FactCategory(uid: "culture", title: "Kultura"),
        FactCategory(uid: "science", title: "Věda"),
        FactCategory(uid: "geography", title: "Geografie")
    ]
}
