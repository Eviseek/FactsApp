//
//  ContentView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appData: AppData
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                LoadingErrorView() {}
                
            case .error(let message):
                LoadingErrorView(error: message, onRefetch: {
                    Task { await viewModel.fetchDataAndShowCorrectView() }
                })
                
            case .tutorial:
                WelcomeView(onFinishTutorial: {
                    Task { await viewModel.completeTutorial() }
                })
                .environmentObject(appData)
                
            case .ready:
                FactListView()
                    .environmentObject(appData)
                    .tint(.activeRed)
            }
        }
        .task {
            viewModel.configure(with: appData)
            await viewModel.fetchDataAndShowCorrectView()
        }
    }
}

#Preview {
    ContentView()
}
