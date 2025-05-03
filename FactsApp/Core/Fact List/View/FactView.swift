//
//  FactView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI

struct FactView: View {
    
    var fact: AppFact
    @EnvironmentObject var appData: AppData
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack {
            Text(fact.text)
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            HStack(spacing: 40) {
                ShareLink(item: fact.text) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                }
                Button {
                    if let url = URL(string: fact.sourceUrl) {
                        openURL(url)
                    }
                } label: {
                    Image(systemName: "info.circle")
                        .font(.title2)
                }
                Button {
                    appData.toggleFavorite(with: fact.id)
                } label: {
                    if appData.isFavorite(fact.id) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    } else {
                        Image(systemName: "heart")
                            .font(.title2)
                    }
                }
            }
        }
        .frame(maxHeight: UIScreen.main.bounds.height - 300)
    }
}


#Preview {
    FactView(fact: AppFact.sampleList[0])
}
