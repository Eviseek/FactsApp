//
//  RegistrationViewModel.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func registerAndLogin() async {
        do {
            try await AuthService.shared.createUser(withEmail: email, password: password)
        } catch {
            print("ERROR \(error.localizedDescription)")
        }
    }
    
    
}
