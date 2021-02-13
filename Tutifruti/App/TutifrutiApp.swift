//
//  TutifrutiApp.swift
//  Tutifruti
//
//  Created by Michael Favre on 16/01/2021.
//

import SwiftUI

@main
struct TutifrutiApp: App {
    
    // MARK: - PROPERTIES
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    
    // MARK: - BODY
    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
