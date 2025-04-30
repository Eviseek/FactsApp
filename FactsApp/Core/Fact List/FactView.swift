//
//  FactView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI

struct FactView: View {
    
    var fact: Fact
    
    var body: some View {
        VStack {
            Text(fact.text)
                .font(.title)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
            
                .padding(.bottom, 20)
                .padding(.horizontal, 20)
            HStack(spacing: 40) {
                Button(action: {}) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.title2)
                }
                Button(action: {}) {
                    Image(systemName: "info.circle")
                        .font(.title2)
                }
                Button(action: {}) {
                    Image(systemName: "heart")
                        .font(.title2)
                }
            }
        }
        .frame(maxHeight: UIScreen.main.bounds.height - 300)
    }
}


#Preview {
    FactView(fact: Fact.sampleList[0])
}
