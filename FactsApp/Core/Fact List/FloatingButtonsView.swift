//
//  FloatingButtonsView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI

struct FloatingButtonsView: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "trash")
                        .padding()
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding()
            }
            Spacer()
            HStack {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "square.grid.2x2")
                        Text("General")
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color(.systemGray5))
                    .cornerRadius(20)
                }
                Spacer()
                HStack(spacing: 20) {
                    Button(action: {}) {
                        Image(systemName: "paintroller")
                            .padding()
                            .background(Color(.systemGray5))
                            .clipShape(Circle())
                    }
                    Button(action: {}) {
                        Image(systemName: "person.crop.circle")
                            .padding()
                            .background(Color(.systemGray5))
                            .clipShape(Circle())
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    FloatingButtonsView()
}
