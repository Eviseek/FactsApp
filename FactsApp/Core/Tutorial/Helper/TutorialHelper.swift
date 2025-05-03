//
//  TutorialHelper.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

class TutorialHelper {
    
    @MainActor
    func fetchAndSetFactsForFirstTime(selectedCategoryIDs: Set<String>, appData: AppData) async {
        appData.setSelectedCategoryIDs(selectedCategoryIDs)
        let facts = await FactsFetcher().fetchFacts(with: appData.categories)
        appData.setFacts(facts)
    }

    @MainActor
    func preloadCategories(into appData: AppData) async {
        let categories = await FactsFetcher().fetchCategories()
        appData.setCategories(categories)
    }
}
