//
//  EmailEntryView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 30.04.2025.
//

import SwiftUI

struct EmailEntryView: View {
    
    @State private var email = ""
    @State private var name = ""
    
    var body: some View {
        VStack {
            Text("Sign up for free or log in")
                .font(.headline)
                .padding()
            TextField("Enter your email", text: $email)
                .font(.subheadline)
                .padding(12)
                .background(Color(.systemGray6))
                .clipShape(.rect(cornerRadius: 10))
                .padding(.horizontal, 24)
            
            NavigationLink {
                // if else
                // check if email in db
                RegisterNameView()
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
    EmailEntryView()
}
