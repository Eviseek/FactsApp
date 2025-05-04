//
//  FactsListHelper.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

@MainActor
class FactsHelper {
    
    let appData: AppDataProtocol
    let fetcher: Fetchable

    init(appData: AppDataProtocol, fetcher: Fetchable = FactsFetcher()) {
        self.appData = appData
        self.fetcher = fetcher
    }

    func loadCategoriesAndFetchFacts() async throws {
        do {
            let facts = try await fetcher.fetchFacts(with: appData.categories)
            appData.setFacts(facts)
        } catch {
            throw error
        }
    }
}
