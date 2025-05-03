//
//  TutorialHelper.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

class TutorialHelper {
    
    private let factsFetcher = FactsFetcher()
    
    @MainActor
    func fetchAndSetFactsForFirstTime(appData: AppData) async {
        do {
            let facts = try await factsFetcher.fetchFacts(with: appData.categories)
            appData.setFacts(facts)
        } catch {
            print("ERROR fetchAndSetFactsForFirstTime \(error.localizedDescription)")
            appData.showError = true
        }
    }

    @MainActor
    func preloadCategories(into appData: AppData) async {
        appData.isfetchingCategories = true
        do {
            let categories = try await factsFetcher.fetchCategories()
            appData.setCategories(categories)
        } catch {
            print("ERROR preloadCategories \(error.localizedDescription)")
            appData.showError = true
        }
        appData.isfetchingCategories = false
    }
}
