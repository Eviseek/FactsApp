//
//  FavoriteFactsView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 03.05.2025.
//

import SwiftUI

struct FavoriteFactsView: View {
    
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        ForEach(appData.favoriteFacts, id:\.self) { fact in
            FavoriteFactView(fact: fact)
        }
    }
}

struct FavoriteFactView: View {
    
    var fact: AppFact
    
    var body: some View {
        VStack {
            Text(fact.text)
        }
    }
    
}

#Preview {
    FavoriteFactsView()
}
