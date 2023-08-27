//  ContentView.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

struct RootScreenView: View {
  @State var shouldSplash = true
    var body: some View {
        VStack{
            if shouldSplash{
                Image("0")
                    .resizable()
                    .scaledToFill()
                    .transition(.opacity)
                    .animation(.easeInOut(duration:1))
      
            }else{
                OnboardingView()
            }
        }.onAppear{
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 1)
                {
                withAnimation{
                    shouldSplash = false
                }
            }
        }
    }
}



