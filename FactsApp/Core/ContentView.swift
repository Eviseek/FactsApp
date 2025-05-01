//
//  ContentView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("hasSeenTutorial") private var hasSeenTutorial = false
    
    var body: some View {
        if hasSeenTutorial {
            FactListView()
        } else {
            WelcomeView(hasSeenTutorial: $hasSeenTutorial)
        }
    }
}

#Preview {
    ContentView()
}
