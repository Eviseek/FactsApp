//
//  WelcomeView.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 30.04.2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var appData: AppData
    
    @State private var hasFinished = false
    @State private var selected: Set<String> = []
    
    var onFinishTutorial: () -> Void
    
    @AppStorage("hasSeenTutorial") private var hasSeenTutorial: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    hasSeenTutorial = true
                    appData.selectedCategoryIDs = []
                    onFinishTutorial()
                } label: {
                    Spacer()
                    Text("Přeskočit")
                        .tint(.activeRed)
                        .font(.body)
                        .padding()
                }
            }
            Image("brno")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .padding(.bottom, 5)
            Text("Vítejte v aplikaci o Brně!")
                .font(.title)
                .bold()
                .padding(.bottom, 2)
                .foregroundStyle(.darkBrown)
            Text("Zvolte si kategorie.")
                .padding(.bottom, 7)
                .foregroundStyle(.darkBrown)
            if appData.isfetchingCategories {
                ProgressView()
                    .tint(.darkBrown)
                    .frame(width: 150)
            } else {
                LoadedCategoryView()
            }
            Spacer()
            Button {
                hasSeenTutorial = true
                onFinishTutorial()
            } label: {
                WelcomeButtonView(text: "Pokračovat")
            }
            .padding(.bottom, 10)
        }
        .background(Color(.backgroundCream))
//        .alert("Něco se pokazilo. Prosím zkuste to později.", isPresented: $appData.showError) {
//            Button("Zavřít.", role: .destructive) {
//                appData.showError = false
//                exit(0) // temporary solution, should be handled with try again option; categories are need to fetch facts 
//            }
//        }
    }
}


struct LoadedCategoryView: View {
    
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        ForEach(appData.categories) { category in
            SelectedCategoryView(category: category)
        }
    }
}

struct SelectedCategoryView: View {
    
    @EnvironmentObject var appData: AppData
    var category: FactCategory
    
    var body: some View {
        Button {
            appData.toggleCategory(with: category.id)
        } label: {
            HStack {
                ReusableImageView(systemName: (appData.isSelected(category.id) ? "checkmark.square" : "square"), size: .small)
                Text(category.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 5)
            }
            .padding(.vertical, 5)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(.darkBrown, lineWidth: 1)
            )
        }
        .tint(.darkBrown)
        .padding(.horizontal, 15)
    }
}

struct WelcomeButtonView: View {
    
    var text: String
    
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Text(text)
                    .padding()
                    .bold()
                    .tint(.backgroundCream)
                Spacer()
            }
            .padding(.vertical, 5)
            .background(Color(.darkBrown))
            .cornerRadius(12)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 15)
    }
    
}

//#Preview {
//    WelcomeView()
//}
