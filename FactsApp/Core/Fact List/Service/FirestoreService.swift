//
//  FirestoreService.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation
import FirebaseFirestore

protocol FirestoreFetchable {
    func fetchFacts(with categories: [FactCategory]) async throws -> [AppFact]?
    func fetchFactCategories() async throws -> [FactCategory]?
}

class FirestoreService: FirestoreFetchable {
    
    // MARK: Fetch from Firebase
    
    func fetchFacts(with categories: [FactCategory]) async throws -> [AppFact]? {
        do {
            let snapshot = try await Firestore.firestore().collection("facts").getDocuments(source: .server) // source: .server is used to avoid caching
            let fbFacts = snapshot.documents.compactMap { try? $0.data(as: FirebaseFact.self) }
            
            var appFacts: [AppFact] = []
            
            for fbFact in fbFacts {
                if let category = categories.first(where: { $0.id == fbFact.categoryId }) {
                    appFacts.append(AppFact(id: fbFact.id, category: category, text: fbFact.text, sourceUrl: fbFact.sourceUrl))
                }
            }
            return appFacts
            
        } catch {
            print("ERROR fetchingFacts \(error.localizedDescription)")
            throw error
        }
    }
    
    func fetchFactCategories() async throws -> [FactCategory]? {
        do {
            let snapshot = try await Firestore.firestore().collection("categories").getDocuments(source: .server) // source: .server is used to avoid caching
            let facts = snapshot.documents.compactMap { try? $0.data(as: FactCategory.self) }
            return facts
        } catch {
            print("ERROR fetchingCategories \(error.localizedDescription)")
            throw error
        }
    }
    
    // MARK: Upload to Firebase
    // these functions are not used anywhere in the app; they were used for initial data upload; left here just for an example
    
    func uploadCategories() async throws {
        let categories = FactCategory.sampleList
        for category in categories {
            do {
                let encodedCategory = try Firestore.Encoder().encode(category)
                try await Firestore.firestore().collection("categories").document(category.id).setData(encodedCategory)
            } catch {
                print("ERROR saving categories \(error.localizedDescription)")
                throw error
            }
        }

    }
    
    func uploadFacts() async throws {
        let facts = FirebaseFact.sampleList
        for fact in facts {
            do {
                let encodedFact = try Firestore.Encoder().encode(fact)
                try await Firestore.firestore().collection("facts").document(fact.id).setData(encodedFact)
            } catch {
                print("ERROR saving facts \(error.localizedDescription)")
                throw error
            }
        }

    }
    
}
