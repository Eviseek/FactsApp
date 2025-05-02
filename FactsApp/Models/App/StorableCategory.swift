//
//  StorableCategory.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

// Category cannot be saved with the Firebase's DocumentID, so here's a storable model
struct StorableCategory: Codable, Identifiable {
    let id: String
    let name: String
}
