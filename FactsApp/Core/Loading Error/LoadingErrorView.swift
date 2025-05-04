//
//  LoadingErrorView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 04.05.2025.
//

import SwiftUI

struct LoadingErrorView: View {
    
    var error: String?
    let onRefetch: () -> Void
    
    var body: some View {
        VStack {
            Image("brno")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .padding(.bottom, 10)
            if error == nil {
                ProgressView("Načítám...")
                    .tint(.darkBrown)
            } else {
                Text("Jejda. Něco se nám pokazilo.")
                    .foregroundStyle(.darkBrown)
                Button {
                    onRefetch()
                } label: {
                    Text("Zkusit to znovu.")
                        .tint(.activeRed)
                        .bold()
                        .padding(.top, 10)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.backgroundCream)
    }
}

#Preview {
    LoadingErrorView(onRefetch: {})
}
