//
//  Fetchable.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 04.05.2025.
//

import Foundation

protocol Fetchable {
    func fetchFacts(with categories: [FactCategory]) async throws -> [AppFact]
    func fetchCategories() async throws -> [FactCategory]
}
