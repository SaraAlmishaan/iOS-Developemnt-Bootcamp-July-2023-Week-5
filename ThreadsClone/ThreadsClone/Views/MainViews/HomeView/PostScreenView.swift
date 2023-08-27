//  PostScreenView.swift
//  ThreadsClone
//  Created by Sara on 27/08/2023.
import Foundation
import SwiftUI

struct PostScreenView: View {
    @EnvironmentObject var userDataViewModel : UserDataViewModel
    let postModel : PostModel
    let userModel : UserModel
    var body: some View {
        ScrollView(showsIndicators: false){
            PostComponentView(
                postModel:postModel,
                userModel: userModel
            )
            Divider()
            ForEach (postModel.replies, id: \.self) { postId in
                if let post = userDataViewModel.fetchPostById(postId) {
                    if let user = userDataViewModel.fetchUserById(post.createdBy){
                        PostComponentView(
                            postModel: post ,
                            userModel: user )
                    }
                    Divider()
                }
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}


