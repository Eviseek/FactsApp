//
//  FirestoreService.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation
import FirebaseFirestore
import Combine

class FirestoreService {
    
    func uploadCategories() async throws {
        let categories = FactCategory.sampleList
        for category in categories {
            do {
                let encodedCategory = try Firestore.Encoder().encode(category)
                try await Firestore.firestore().collection("categories").document(category.id).setData(encodedCategory)
            } catch {
                print("ERROR saving categories \(error.localizedDescription)")
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
            }
        }

    }
    
    func fetchFacts(with categories: [FactCategory]) async throws -> [AppFact]? {
        do {
            let snapshot = try await Firestore.firestore().collection("facts").getDocuments(source: .server)
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
            let snapshot = try await Firestore.firestore().collection("categories").getDocuments(source: .server)
            let facts = snapshot.documents.compactMap { try? $0.data(as: FactCategory.self) }
            return facts
        } catch {
            print("ERROR fetchingCategories \(error.localizedDescription)")
            throw error
        }
    }
    
    
}
