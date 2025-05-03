//
//  FactsFetcher.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

class FactsFetcher {
    
    func fetchFacts(with categories: [FactCategory]) async throws -> [AppFact] { //TODO: re-do
        do {
            let facts = try await FirestoreService().fetchFacts(with: categories)
            return facts ?? [AppFact]()
        } catch {
            print("ERROR fetchFacts \(error.localizedDescription)")
            throw error
        }
    }
    
    func fetchCategories() async throws -> [FactCategory] {
        do {
            let categories = try await FirestoreService().fetchFactCategories()
            return categories ?? [FactCategory]()
        } catch {
            print("ERROR fetchCategories \(error.localizedDescription)")
            throw error
        }
    }
    
}
