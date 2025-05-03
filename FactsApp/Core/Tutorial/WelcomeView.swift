//
//  WelcomeView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 30.04.2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var appData: AppData
    
    @State private var hasFinished = false
    @State private var selected: Set<String> = []
    
    var onFinishTutorial: (_ selectedCategoryIDs: Set<String>) -> Void
    
    @AppStorage("hasSeenTutorial") private var hasSeenTutorial: Bool = false
    
    var body: some View {
        VStack {
            Text("Vítejte v aplikaci o Brněnkých faktech.")
            Text("Select your categories.")
            ForEach(appData.categories) { category in
                Button(category.title) {
                    if selected.contains(category.id) {
                        selected.remove(category.id)
                    } else {
                        selected.insert(category.id)
                    }
                }
            }
            Button {
                hasSeenTutorial = true
                onFinishTutorial(selected)
            } label: {
                Text("Click to continue")
            }
            Button {
                hasSeenTutorial = true
                selected = []
                onFinishTutorial(selected)
            } label: {
                Text("Skip")
            }
            
        }
    }
}

//#Preview {
//    WelcomeView()
//}
