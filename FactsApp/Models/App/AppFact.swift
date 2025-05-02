//
//  AppFact.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 01.05.2025.
//

import Foundation

struct AppFact: Hashable, Identifiable {
    var id: String
    var category: FactCategory
    var text: String
    var sourceUrl: String
}

extension AppFact {
    static let sampleList: [AppFact] = [
        AppFact(id: FirebaseFact.sampleList[0].id, category: FactCategory.sampleList[0], text: FirebaseFact.sampleList[0].text, sourceUrl: FirebaseFact.sampleList[0].sourceUrl),
        AppFact(id: FirebaseFact.sampleList[1].id, category: FactCategory.sampleList[1], text: FirebaseFact.sampleList[1].text, sourceUrl: FirebaseFact.sampleList[1].sourceUrl),
    ]
}
