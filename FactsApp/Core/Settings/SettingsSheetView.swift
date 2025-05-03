//
//  SettingsSheetView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 01.05.2025.
//

import SwiftUI

struct SettingsSheetView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
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
                    Text("Brno Facts")
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
                    
                    if viewModel.currentUser == nil {
                        SettingsItem(icon: "person", label: "Sign up", destination: RegistrationView())
                        SettingsItem(icon: "person", label: "Log in", destination: LoginView())
                    } else {
                        LoggedUserItem()
                    }
                    
                    SettingsItem(icon: "heart", label: "Favorites", destination: FavoriteFactsView())
                    
                    Spacer()
                    
                    // show log out only if user is logged in
                    if viewModel.currentUser != nil {
                        Button {
                            Task {
                                AuthService.shared.signOut()
                            }
                        } label: {
                            Text("Log Out")
                                .foregroundColor(.red)
                                .padding()
                                .frame(maxWidth: .infinity)
                        }
                        .background(Color(.systemGray6))
                        .cornerRadius(12)
                        .padding()
                    }
                }
                .background(Color(.systemGroupedBackground))
            }
        }
    }
}
    
struct SettingsItem<Destination: View>: View {
    
    var icon: String
    var label: String
    var destination: Destination
    
    var body: some View {
        VStack(spacing: 1) {
            // TODO: show only if logged
            NavigationLink {
                destination
            } label: {
                HStack {
                    Image(systemName: icon)
                    Text(label)
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
}

struct LoggedUserItem: View {
    
    var body: some View {
        VStack(spacing: 1) {
            Text("You are logged")
        }
    }
}

#Preview {
    SettingsSheetView()
}
