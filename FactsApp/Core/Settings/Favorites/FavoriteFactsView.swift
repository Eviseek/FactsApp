//
//  FavoriteFactsView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 03.05.2025.
//

import SwiftUI

struct FavoriteFactsView: View {
    
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        VStack {
            if appData.favoriteFacts.isEmpty {
                EmptyFactView()
            } else {
                Text("Oblíbené fakty")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.darkBrown)
                Divider()
                    .padding()

                ScrollView {
                    ForEach(appData.favoriteFacts, id:\.self) { fact in
                        FavoriteFactView(fact: fact)
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .background(.sheetLightCream)
    }
}

struct EmptyFactView: View {
    
    var body: some View {
        VStack {
            Text("Žádný oblíbený fakt? Klikni na srdíčko a nějaký přidej.")
                .font(.title3)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundStyle(.darkBrown)
        }
    }
    
}

struct FavoriteFactView: View {
    
    var fact: AppFact
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Text(fact.text)
                    .font(.title3)
                    .foregroundStyle(.darkBrown)
                    .padding(.leading, 10)
                    .padding(.vertical, 10)
                    .frame(width: UIScreen.main.bounds.width - 100, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
                ShareLink(item: fact.text) {
                    ReusableImageView(systemName: "square.and.arrow.up", size: .small)
                        .padding(.trailing, 5)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 5)
        .background(Color(.lightBrown))
        .cornerRadius(12)
        .padding(.horizontal, 15)
    }
}

#Preview {
    FavoriteFactsView()
}
