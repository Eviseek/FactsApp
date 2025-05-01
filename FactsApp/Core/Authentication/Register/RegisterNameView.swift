//
//  RegisterNameView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 01.05.2025.
//

import SwiftUI

struct RegisterNameView: View {
    
    @State private var name = ""
    @State private var continueToNext = false
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal, 24)
            NavigationLink {
                RegisterPasswordView()
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
    RegisterNameView()
}
