//
//  TutorialHelper.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

@MainActor
class TutorialHelper {
    
    private let factsFetcher: Fetchable
    
    init(fetcher: Fetchable = FactsFetcher()) {
        self.factsFetcher = fetcher
    }

    @MainActor
    func preloadCategories(into appData: AppDataProtocol) async throws {
        do {
            let categories = try await factsFetcher.fetchCategories()
            appData.setCategories(categories)
        } catch {
            print("ERROR preloadCategories \(error.localizedDescription)")
            throw error
        }
    }
}
