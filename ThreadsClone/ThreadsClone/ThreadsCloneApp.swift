//  ThreadsCloneApp.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

@main
struct ThreadsCloneApp: App {
    @ObservedObject var userPreferencesViewModel = UserPreferencesViewModel()
    @ObservedObject var auth = AuthViewModel()
    @ObservedObject var userDataViewModel = UserDataViewModel()
    
    init() {
        auth.reset()
    }
    
    var body: some Scene {
        WindowGroup {
            
                RootScreenView()
                    .environmentObject(userPreferencesViewModel)
                    .environmentObject(auth)
                    .environmentObject(userDataViewModel)
            
        }
    }
}
