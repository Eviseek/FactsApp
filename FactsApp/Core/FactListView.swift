//
//  MainView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI

struct FactListView: View {
    
    var facts = Fact.sampleList
    
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

#Preview {
    FactListView()
}
