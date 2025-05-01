//
//  SelectCategoriesView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 30.04.2025.
//

import SwiftUI

struct SelectCategoriesView: View {
    
    var body: some View {
        VStack {
            Text("Select your categories.")
            Button {
                // TODO: save the categories?
            } label: {
                Text("Click to continue")
            }
        }
    }
}

#Preview {
    SelectCategoriesView()
}
