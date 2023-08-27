//  UserDataViewModel.swift
//  ThreadsClone
//  Created by Sara on 21/08/2023.
import Foundation
import SwiftUI

class UserDataViewModel: ObservableObject {
    @Published var posts: Array<PostModel> = []
    @Published var users: Array<UserModel> = []
    
    init() {
        // Preparing Users
        let maxNumberOfUsers = 10
        for _ in 0..<maxNumberOfUsers {
            let firstAndLastName = makeRandomFullName()
            let userName = "\(firstAndLastName [0]).\(firstAndLastName[1])".lowercased()
            let fullName = "\(firstAndLastName[0]) \(firstAndLastName[1])"
            let user = UserModel(
              userName: userName,
              fullName: fullName,
              bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.e velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              image: "https://source.unsplash.com/200x200/?profile",
              followers: [],
              following: [],
              posts: []
            )
            users.append(user)
        }
        
        // Preparing posts
        let maxNumberOfPosts = maxNumberOfUsers * 5
        for _ in 0..<maxNumberOfPosts {
            let userId = users.randomElement()!.id
            let post = PostModel(
                content: makeRandomContent(),
                attachments: makeRandomAttachment(),
                likes: [],
                replies: [],
                createdAt: Date(),
                createdBy: userId
            )
            posts.append(post)
            
            // Linking currentPost to userPosts
            let userIndex = users.firstIndex(where: { user in
                user.id == userId
              }
            )
            if let userIndex = userIndex {
                users[userIndex].posts.append(post.id)
            }
        }
        
        // Following + Followers
        for _ in 0..<(maxNumberOfUsers * 4) {
            let user1Index = users.indices.randomElement ()!
            let user2Index = users.indices.randomElement ()!
            if user1Index != user2Index {
                let isNotFollowing = users[user1Index].following
                    .contains(users[user2Index].id) == false
                if isNotFollowing {
                    // User 1 following User 2
                    users[user1Index].following.append(users[user2Index].id)
                    // User 2 has new follower
                    users[user2Index].followers.append(users[user1Index].id)
                }
            }
        }
        
        // likes
        for _ in 0..<(maxNumberOfPosts * 4) {
            let userIndex = users.indices.randomElement()!
            let postIndex = posts.indices.randomElement()!
            let isNotLiking  = posts[postIndex].likes
                .contains(users[userIndex].id) == false
            if isNotLiking {
                posts[postIndex].likes.append(users[userIndex].id)
            }
        }
        
    }// init()
    
    //------------------------------------------------------------------------------------//
    func fetchUserById(_ userId: UserModel.ID) -> Optional<UserModel> {
        let index = users.firstIndex(where: { user in
            user.id == userId
        })
        if let index = index {
            return users[index]
        } else {
            return nil
        }
    }
    
    func fetchPostById(_ postId: PostModel.ID) -> Optional<PostModel> {
        let index = posts.firstIndex(where: { post in
            post.id == postId
        })
        if let index = index {
            return posts[index]
        } else {
            return nil
        }
    }
    
    func fetchData(){
        let numberOfPost = Int.random(in: 0...10)
        var arrayOfPost = Array <PostModel>()
        for _ in 0...numberOfPost {
            let  post = PostModel(
                content: makeRandomContent(),
                attachments: makeRandomAttachment(),
                likes:[],
                replies:[],
                createdAt: Date(),
                createdBy: UUID()
            )
            arrayOfPost.append(post)
            
        }
        posts = arrayOfPost
    }
    //------------------------------------------------------------------------------------//

    func makeRandomFullName() ->Array<String> {
        let name = """
           Amal Fahad
           Omar Ahmad
           Ibraheem Khalid
           Sara Fahad
           Saleh Naser
           Azam Mohammed
           Azoz Salman
           Nawaf Salem
           Nourah Mansour
           Reid Nolan
           Jade Solomon
           Semaj Lewis
           Taylor Medina
           Chase Cohen
           Barbara Nielsen
           Amy Mays
           Jayvon Black
           Peter Hart
           Pierre Moody
           """
            .components(separatedBy: "\n")
        return name.randomElement()!.components(separatedBy: " ")
    }
    
    func makeRandomContent() -> Optional<String> {
        let shouldContainContent = Bool.random()
        if shouldContainContent {
            return """
             Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.e velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
             """
        }else {
            return nil
        }
    }
    
    func makeRandomAttachment() -> Array<URL> {
        let numberOfImage = Int.random(in: 0...5)
        var arrayOfURLs = Array<URL>()
        
        for _ in 0...numberOfImage {
            arrayOfURLs.append(URL(string: "https://source.unsplash.com/500x300")!)
        }
        return arrayOfURLs
    }
    
}
