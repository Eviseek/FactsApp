//
//  FactsAppApp.swift
//  FactsApp
//
//  Created by Eva Chlpikova on 27.04.2025.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FactsAppApp: App {
    
    @AppStorage("hasSeenTutorial") private var hasSeenTutorial: Bool = false
    
    @StateObject private var appData = AppData()
    private let tutorialHelper = TutorialHelper()
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            if hasSeenTutorial {
                FactListView()
                    .tint(Color(.activeRed))
                    .environmentObject(appData)
                    .task {
                        let factsHelper = FactsHelper(appData: appData)
                        await factsHelper.loadCategoriesAndFetchFacts()
                    }
            } else {
                WelcomeView(
                    onFinishTutorial: {
                        Task {
                            await tutorialHelper.fetchAndSetFactsForFirstTime(appData: appData)
                        }
                    }
                )
                .tint(Color(.activeRed))
                .environmentObject(appData)
                .task {
                    await tutorialHelper.preloadCategories(into: appData)
                }
            }
        }
    }
}
