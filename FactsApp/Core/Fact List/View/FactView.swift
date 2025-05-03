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
                .foregroundStyle(.darkBrown)
            
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            HStack(spacing: 40) {
                ShareLink(item: fact.text) {
                    ReusableImageView(systemName: "square.and.arrow.up", size: .medium)
                }
                Button {
                    if let url = URL(string: fact.sourceUrl) {
                        openURL(url)
                    }
                } label: {
                    ReusableImageView(systemName: "info.circle", size: .medium)
                }
                Button {
                    appData.toggleFavorite(with: fact.id)
                } label: {
                    ReusableImageView(systemName: (appData.isFavorite(fact.id) ? "heart.fill" : "heart"), size: .medium)
                }
            }
        }
        .frame(maxHeight: UIScreen.main.bounds.height - 300)
    }
}


#Preview {
    FactView(fact: AppFact.sampleList[0])
}
