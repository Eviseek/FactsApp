//
//  TutorialHelper.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

@MainActor
class TutorialHelper {
    
    private let factsFetcher = FactsFetcher()

    @MainActor
    func preloadCategories(into appData: AppData) async throws {
        do {
            let categories = try await factsFetcher.fetchCategories()
            appData.setCategories(categories)
        } catch {
            print("ERROR preloadCategories \(error.localizedDescription)")
            throw error
        }
    }
}
