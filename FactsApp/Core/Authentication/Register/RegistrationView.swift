//
//  RegistrationView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 01.05.2025.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject private var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextField("Enter your email", text: $viewModel.email)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal, 24)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
            
            SecureField("Enter your password", text: $viewModel.password)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal, 24)
            
            Button {
                Task {
                    await viewModel.registerAndLogin()
                    dismiss()
                }
            } label: {
                Text("Continue")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    RegistrationView()
}
