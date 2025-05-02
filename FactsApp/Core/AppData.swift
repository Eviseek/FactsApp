//
//  AppData.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation
import Combine

class AppData: ObservableObject {
    
    @Published var facts: [AppFact] = []
    @Published var categories: [FactCategory] = []
    @Published var selectedCategoryIDs: Set<String> = []
    
    private(set) var hasLoaded = false
    
    private let selectedCategoryKey = "selectedCategoryIDs"
    private let categoryKey = "factCategories"
    

    init() {
        loadCategories()
        loadSelectedCategoryIDs()
    }
    
    // MARK: Facts and categories
    
//    var filteredFacts: [AppFact] {
//        if selectedCategoryIDs.isEmpty { return facts } // return all facts if no categories were selected
//        return facts.filter { selectedCategoryIDs.contains($0.category.id) }
//    }
    
    func setFacts(_ facts: [AppFact]) {
        self.facts = facts
        self.hasLoaded = true
    }
    
    func setCategories(_ categories: [FactCategory]) {
        self.categories = categories
        print("categories are \(categories)")
        let storable = categories.map { StorableCategory(id: $0.id, name: $0.title) }
        saveCategories(storable)
    }
    
    func setSelectedCategoryIDs(_ ids: Set<String>) {
        self.selectedCategoryIDs = ids
        saveSelectedCategoryIDs()
    }
    
    // MARK: UserDefaults
    
    private func saveSelectedCategoryIDs() {
        let array = Array(selectedCategoryIDs)
        UserDefaults.standard.set(array, forKey: selectedCategoryKey)
        print("SAVED selectedCategory id")
    }

    private func loadSelectedCategoryIDs() {
        if let stored = UserDefaults.standard.array(forKey: selectedCategoryKey) as? [String] {
            selectedCategoryIDs = Set(stored)
        }
    }
    
    func saveCategories(_ storable: [StorableCategory]) {
        if let data = try? JSONEncoder().encode(storable) {
            UserDefaults.standard.set(data, forKey: categoryKey)
            print("SAVED categories id")
        } else {
            print("FAILED could not save categories")
        }
    }

    func loadCategories() {
        if let data = UserDefaults.standard.data(forKey: categoryKey),
           let categories = try? JSONDecoder().decode([FactCategory].self, from: data) {
            self.categories = categories
        }
    }
    
}
