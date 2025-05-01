//
//  WelcomeView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 30.04.2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @Binding var hasSeenTutorial: Bool
    
    var body: some View {
        VStack {
            Text("Vítejte v aplikaci o Brněnkých faktech.")
            Button {
                hasSeenTutorial = true
            } label: {
                Text("Click to continue")
            }
        }
    }
}

#Preview {
    WelcomeView(hasSeenTutorial: .constant(false))
}
