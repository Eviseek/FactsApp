//
//  UserService.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class UserService {
    
    @Published var currentUser: FirebaseUser? //TODO: rewrite to app user
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let fbUser = try snapshot.data(as: FirebaseUser.self)
        self.currentUser = fbUser
        print("current user is \(fbUser)")
    }

}
