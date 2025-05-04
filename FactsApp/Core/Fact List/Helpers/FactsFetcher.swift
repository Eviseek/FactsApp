//
//  FactsFetcher.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

class FactsFetcher: Fetchable {
    
    private let firestoreService = FirestoreService()
    
    func fetchFacts(with categories: [FactCategory]) async throws -> [AppFact] {
        do {
            let facts = try await firestoreService.fetchFacts(with: categories)
            return facts ?? [AppFact]()
        } catch {
            print("ERROR fetchFacts \(error.localizedDescription)")
            throw error
        }
    }
    
    func fetchCategories() async throws -> [FactCategory] {
        do {
            let categories = try await firestoreService.fetchFactCategories()
            return categories ?? [FactCategory]()
        } catch {
            print("ERROR fetchCategories \(error.localizedDescription)")
            throw error
        }
    }
    
}
