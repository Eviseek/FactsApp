//
//  LoginViewModel.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func login() async {
        do {
            try await AuthService.shared.login(withEmail: email, password: password)
        } catch {
            print("ERROR \(error.localizedDescription)")
        }
    }
    
}
