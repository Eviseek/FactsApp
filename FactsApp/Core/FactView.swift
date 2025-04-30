//
//  FactView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI

struct XyzView: View {
    let facts = [
        Fact(text: "Your brain does more creative work when you're tired. Your brain does more creative work when you're tired. Your brain does more creative work when you're tired. Your brain does more creative work when you're tired. Your brain does more creative work when you're tired. Your brain does more creative work when you're tired. Your brain does more creative work when you're tired. Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired.Your brain does more creative work when you're tired."),
        Fact(text: "Another creative fact."),
        Fact(text: "Fact.")
    ]
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(facts, id:\.self) { fact in
                        FactView(fact: fact)
                            .background(.red)
                            .frame(width: UIScreen.main.bounds.width)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)

            
            FloatingButtonsView()
        }
    }
}

struct FactView: View {
    let fact: Fact
    
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
    XyzView()
}
