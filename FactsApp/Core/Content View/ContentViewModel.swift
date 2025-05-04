//
//  ContentViewModel.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 04.05.2025.
//

import Foundation
import SwiftUI

enum LaunchState {
    case loading
    case error(String)
    case ready
    case tutorial
}

@MainActor
class ContentViewModel: ObservableObject {
    
    @AppStorage("hasSeenTutorial") var hasSeenTutorial: Bool = false
    
    @Published var state: LaunchState = .loading
    @Published var appData: AppData?
    
    private var tutorialHelper: TutorialHelper?
    private var factsHelper: FactsHelper?
    
    func configure(with appData: AppData) {
        self.appData = appData
        if !hasSeenTutorial { tutorialHelper = TutorialHelper() } // set only if user should see the tutorial
        factsHelper = FactsHelper(appData: appData)
    }

    func fetchDataAndShowCorrectView() async {
        state = .loading
            
        if !hasSeenTutorial {
            await fetchInitialData()
        } else {
            await fetchDataOnShowFactsList()
        }
        
    }
    
    func completeTutorial() async {
        state = .loading
        await fetchDataOnShowFactsList()
        hasSeenTutorial = true
        state = .ready
    }
    
    private func fetchInitialData() async {
        guard let tutorialHelper = tutorialHelper, let appData = appData else { return }
        do {
            try await tutorialHelper.preloadCategories(into: appData)
            state = .tutorial
        } catch {
            setErrorState(error: error.localizedDescription)
        }
    }
    
    private func fetchDataOnShowFactsList() async {
        guard let factsHelper = factsHelper else { return }
        do {
            try await factsHelper.loadCategoriesAndFetchFacts()
            state = .ready
        } catch {
            setErrorState(error: error.localizedDescription)
        }
    }
    
    private func setErrorState(error: String) {
        state = .error(error)
    }
    
}
