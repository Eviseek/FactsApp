//
//  SettingsViewModel.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 02.05.2025.
//

import Foundation
import Combine

class SettingsViewModel: ObservableObject {
    
    @Published var currentUser: FirebaseUser?
    private var cancellables = Set<AnyCancellable>()

    
    init() {
        setSubscribers()
    }
    
    private func setSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
    
}
