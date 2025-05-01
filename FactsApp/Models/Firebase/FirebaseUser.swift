//
//  FirebaseUser.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import Foundation
import FirebaseFirestore

struct FirebaseUser: Codable, Identifiable, Hashable {
    @DocumentID var uid: String?
    var name: String
    var imageUrl: String?
    var favoriteFacts: [String] //pole se facts ids
    var favoriteCategories: [String] = [String]() //empty = any
    
    var id: String {
        return uid ?? NSUUID().uuidString
    }
    
}
