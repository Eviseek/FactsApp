//
//  SettingsSheetView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 01.05.2025.
//

import SwiftUI

struct SettingsSheetView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Header
                HStack {
                    Button("Done") {
                        dismiss()
                    }
                    .font(.body)
                    .padding()
                    Spacer()
                }

                // Title
                HStack {
                    Text("Facts")
                        .font(.largeTitle).bold()
                        .padding(.horizontal)
                    Spacer()
                }
                .padding(.bottom, 20)

                // Section: Settings
                VStack(alignment: .leading, spacing: 8) {
                    Text("SETTINGS")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)

                    VStack(spacing: 1) {
                        NavigationLink {
                            EmailEntryView()
                        }
                        label: {
                            HStack {
                                Image(systemName: "person.crop.circle")
                                Text("Sign Up")
                                Spacer()
                            }
                            .padding()
                        }
                        .background(Color.white)
                        
                        
                        // TODO: show only if logged
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "heart")
                                Text("Favorites")
                                Spacer()
                            }
                            .padding()
                        }
                        .background(Color.white)
                    }
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }

                Spacer()

                // TODO: show only if logged
                Button(action: {}) {
                    Text("Log Out")
                        .foregroundColor(.red)
                        .padding()
                        .frame(maxWidth: .infinity)
                }
                .background(Color(.systemGray6))
                .cornerRadius(12)
                .padding()
            }
            .background(Color(.systemGroupedBackground))
        }
    }
}

#Preview {
    SettingsSheetView()
}
