//
//  FactsListHelper.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

@MainActor
class FactsHelper {
    
    let appData: AppData
    let fetcher: FactsFetcher

    init(appData: AppData, fetcher: FactsFetcher = FactsFetcher()) {
        self.appData = appData
        self.fetcher = fetcher
    }

    func loadCategoriesAndFetchFacts() async {
        if appData.categories.isEmpty {
            appData.loadCategories()
        }
        let facts = await fetcher.fetchFacts(with: appData.categories)
        appData.setFacts(facts)
        print("loaded categories and loaded data \(facts)")
    }
}
