//
//  FloatingButtonsView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI

struct FloatingButtonsView: View {
    
    @State private var openSettingsSheet = false
    @State private var openAuthSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    openSettingsSheet = true
                } label: {
                    ReusableImageView(systemName: "ellipsis", size: .medium)
                }
                .sheet(isPresented: $openSettingsSheet, content: {
                    SettingsSheetView()
                })
                .padding()
            }
            Spacer()
        }
    }
}

#Preview {
    FloatingButtonsView()
}
