//  HomeView.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import Foundation
import SwiftUI

struct HomeView: View {
    @EnvironmentObject  var userDataViewModel : UserDataViewModel
    var body: some View {
        ScrollView(showsIndicators: false){
            ForEach(userDataViewModel.posts) { post in
                if let user = userDataViewModel.fetchUserById(post.createdBy){
                    NavigationLink(
                        destination: {
                        PostScreenView(postModel: post,
                                       userModel: user)
                    },label: {
                        PostComponentView(postModel: post,
                                          userModel: user)
                            
                        }
                    )
                    .buttonStyle(.plain)
                    Divider()
                }

            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
