//
//  SettingsSheetView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 01.05.2025.
//

import SwiftUI

struct SettingsSheetView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                SettingsHeaderView()
                SettingsItem(icon: "heart", label: "Oblíbené fakty", destination: FavoriteFactsView())
                Spacer()
            }
            .background(Color(.sheetLightCream))
        }
    }
}

struct SettingsHeaderView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Spacer()
            Button("Zavřít") {
                dismiss()
            }
            .font(.body)
            .padding()
        }
        HStack {
            Text("Menu")
                .font(.largeTitle)
                .bold()
                .padding(.horizontal)
                .foregroundStyle(.darkBrown)
            Spacer()
        }
        .padding(.bottom, 20)
    }
}
    
struct SettingsItem<Destination: View>: View {
    
    var icon: String
    var label: String
    var destination: Destination
    
    var body: some View {
        VStack(spacing: 1) {
            NavigationLink {
                destination
            } label: {
                HStack {
                    ReusableImageView(systemName: "heart.fill", size: .small)
                        .tint(.darkBrown)
                    Text(label)
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.darkBrown)
                    Spacer()
                }
                .padding(.vertical, 5)
                .background(Color(.lightBrown))
                .cornerRadius(12)
            }
        }
        .padding(.horizontal, 15)
    }
}

#Preview {
    SettingsSheetView()
}
