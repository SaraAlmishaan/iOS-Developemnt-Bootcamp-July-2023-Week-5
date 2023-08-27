//  OnboardingView.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

struct OnboardingView: View {
   enum CurrentPresentedView{
     case authentication
     case mainView
   }
  @EnvironmentObject var auth : AuthViewModel
  @EnvironmentObject var userDataViewModel : UserDataViewModel
  @State var presentedView : CurrentPresentedView = .authentication
  var body: some View {
      switch presentedView {
         case .mainView:
            MainView()
         case .authentication:
             VStack{
                 Image("1")
                   .resizable()
                   .frame(width: 430)
                   .scaledToFit()
                   .ignoresSafeArea()
                 Button(
                    action: {
                        if auth.signIn(userDataViewModel.users.randomElement()!.id){
                            presentedView = .mainView
                        }
                        else {
                            presentedView  = .authentication
                        }

                    },
                     label: {
                       HStack{
                             Text("Log in with instagram")
                                .font(.callout)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, maxHeight: .infinity ,alignment: .leading)
                                .padding()
                             Image(systemName: "camera.metering.center.weighted")
                                  .frame(width: 30, height: 30, alignment: .center)
                                  .padding(30)
                                  .scaleEffect(2.3)
                                  .foregroundStyle(
                                      .linearGradient(
                                          colors: [.purple,.pink,.red, .orange],
                                          startPoint: .top,
                                          endPoint: .bottom
                                    )
                                  )
                          }.frame(width: 370, height: 80)
                            .overlay(
                               RoundedRectangle(cornerRadius: 22)
                                .stroke(.gray.opacity(0.3), lineWidth: 1.5)
                             )
                        }
                  )
               
                }.onAppear{
                  if auth.currentUserId.isEmpty == false {
                     presentedView = .mainView
                   }
                }
     }
  }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


