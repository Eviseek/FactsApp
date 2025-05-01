//
//  LoginPasswordView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 01.05.2025.
//

import SwiftUI

struct LoginPasswordView: View {
    
    @State private var password = ""
    
    var body: some View {
        VStack {
            SecureField("Enter your password", text: $password)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal, 24)
            
            Button {
                // login with fb
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
    LoginPasswordView()
}
