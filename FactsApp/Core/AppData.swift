//
//  AppData.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation
import Combine

protocol AppDataProtocol {
    var categories: [FactCategory] { get set }
    func setFacts(_ facts: [AppFact])
}

class AppData: ObservableObject, AppDataProtocol {
    
    @Published var facts: [AppFact] = []
    @Published var categories: [FactCategory] = []
    @Published var selectedCategoryIDs: Set<String> = []
    @Published var favoriteFactIDs: Set<String> = []
        
    private let selectedCategoryKey = "selectedCategoryIDs"
    private let favoriteFactsKey = "favoriteFactsKey"
    private let categoryKey = "factCategories"
    

    init() {
        loadCategories()
        loadSelectedCategoryIDs()
        loadFavoriteFactIDs()
    }
    
    // MARK: Favorite facts
    
    var favoriteFacts: [AppFact] {
        if favoriteFactIDs.isEmpty { return [AppFact]() } // return empty if no facts are favorite
        return facts.filter { favoriteFactIDs.contains($0.id) }
    }
    
    func toggleFavorite(with factId: String) {
        if favoriteFactIDs.contains(factId) {
            favoriteFactIDs.remove(factId)
        } else {
            favoriteFactIDs.insert(factId)
        }
        saveFavoriteFactIDs()
    }
    
    func isFavorite(_ factId: String) -> Bool {
        if favoriteFactIDs.contains(factId) {
            return true
        } else {
            return false
        }
    }
    
    private func saveFavoriteFactIDs() {
        let array = Array(favoriteFactIDs)
        UserDefaults.standard.set(array, forKey: favoriteFactsKey)
    }

    private func loadFavoriteFactIDs() {
        if let stored = UserDefaults.standard.array(forKey: favoriteFactsKey) as? [String] {
            favoriteFactIDs = Set(stored)
        }
    }
    
    // MARK: Fetched facts
    
    var filteredFacts: [AppFact] {
        if selectedCategoryIDs.isEmpty { return facts } // return all facts if no categories were selected
        return facts.filter { selectedCategoryIDs.contains($0.category.id) }
    }

    
    func setFacts(_ facts: [AppFact]) {
        self.facts = facts
    }
    
    // MARK: All categories
    
    func setCategories(_ categories: [FactCategory]) {
        self.categories = categories
        saveCategories()
    }
    
    private func saveCategories() {
        let storable = categories.map { StorableCategory (id: $0.id, title: $0.title) }
        if let data = try? JSONEncoder().encode(storable) {
            UserDefaults.standard.set(data, forKey: categoryKey)
        } else {
            print("ERROR saveCategories - failed to save categories.")
        }
    }

    func loadCategories() {
        if let data = UserDefaults.standard.data(forKey: categoryKey),
           let categories = try? JSONDecoder().decode([StorableCategory].self, from: data) {
            self.categories = categories.map { FactCategory (uid: $0.id, title: $0.title) }
        } else {
            print("ERROR loadCategories - failed to load categories.")
        }
    }
    
    // MARK: Selected categories
    
    func toggleCategory(with categoryId: String) {
        if selectedCategoryIDs.contains(categoryId) {
            selectedCategoryIDs.remove(categoryId)
        } else {
            selectedCategoryIDs.insert(categoryId)
        }
        saveSelectedCategoryIDs()
    }
    
    // Used in the WelcomeView to track which categories were checked
    func isSelected(_ categoryId: String) -> Bool {
        if selectedCategoryIDs.contains(categoryId) {
            return true
        } else {
            return false
        }
    }
    
    private func saveSelectedCategoryIDs() {
        let array = Array(selectedCategoryIDs)
        UserDefaults.standard.set(array, forKey: selectedCategoryKey)
    }

    private func loadSelectedCategoryIDs() {
        if let stored = UserDefaults.standard.array(forKey: selectedCategoryKey) as? [String] {
            selectedCategoryIDs = Set(stored)
        }
    }
    
}
