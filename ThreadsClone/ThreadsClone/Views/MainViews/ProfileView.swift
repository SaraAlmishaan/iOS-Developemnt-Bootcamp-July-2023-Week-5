//  ProfileView.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

struct ProfileView: View {
    enum ProfileCategory : String, CaseIterable{
        case EditProfile
        case ShareProfile
        
        var title : String{
            switch self {
            case .EditProfile : return "Edit Profile"
            case .ShareProfile  : return "Share Profile"
      
            }
        }
    }
    @EnvironmentObject var auth: AuthViewModel
    @EnvironmentObject var userDataViewModel: UserDataViewModel
    
    @State var CurrentSelected : ProfileCategory  = .EditProfile
    @State var currentUser: UserModel?
    @State var currentUserPosts: [PostModel] = []
    var body: some View {
        VStack(alignment: .leading) {
            if let currentUser = currentUser {
                VStack(alignment: .leading){
                    
                    HStack{
                        Spacer()
                        Button(
                            action: {
                                auth.signOut()
                            },
                            label: {
                                Text("Logout")
                                    .foregroundColor(.blue)
                            }
                        )
                    }
                    
                    HStack{
                        VStack(alignment: .leading){
                            if let fullName = currentUser.fullName {
                                Text(fullName)
                                    .font(.title)
                                    .padding(.bottom, -9)
                            }
                            Text(currentUser.userName)
                        }
                        Spacer()
                        if let userImage = currentUser.image {
                            AsyncImage( url : URL(string : userImage ),
                                        content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 75)
                                    .cornerRadius(50)
                            },
                                        placeholder: {
                                ProgressView()
                            }
                            )
                        }
                    }
                    if let bio = currentUser.bio {
                        Text(bio)
                    }
                    Text("\(currentUser.followers.count) followers")
                    
                    
                    HStack{
                        ForEach(ProfileCategory.allCases, id : \.self){ category in
                            Button(
                                action: {
                                    CurrentSelected = category
                                    
                                },
                                label: {
                                    if CurrentSelected == category{
                                        Text(category.title)
                                            .frame(width:190 , height: 42 )
                                            .foregroundColor(Color.white)
                                            .bold()
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(Color.black)
                                                    )
                                            )
                                    }else{
                                        Text(category.title)
                                            .frame(width:190 , height: 42 )
                                            .foregroundColor(Color.black)
                                            .bold()
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(Color.white)
                                                        
                                                    )
                                            )
                                    }
                                }
                            )
                        }
                    }
                    
                    Spacer()
                }//VStack
                .padding()
            }else{
                VStack(alignment: .leading){
                    
                    HStack{
                        Spacer()
                        Button(
                            action: {
                                auth.signOut()
                            },
                            label: {
                                Text("Logout")
                                    .foregroundColor(.blue)
                            }
                        )
                    }
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text(String(repeating: "*", count: 16))
                                    .font(.title)
                                    .padding(.bottom, -9)
                            Text(String(repeating: "*", count: 25))
                        }
                        Spacer()
                        Circle()
                            .frame(width: 75, height: 75)
                    }
                    Text(String(repeating: "*", count: 128))
                    Text("0 followers")
                    
                    
                    HStack{
                        ForEach(ProfileCategory.allCases, id : \.self){ category in
                            Button(
                                action: {
                                    CurrentSelected = category
                                    
                                },
                                label: {
                                    if CurrentSelected == category{
                                        Text(category.title)
                                            .frame(width:190 , height: 42 )
                                            .foregroundColor(Color.white)
                                            .bold()
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(Color.black)
                                                    )
                                            )
                                    }else{
                                        Text(category.title)
                                            .frame(width:190 , height: 42 )
                                            .foregroundColor(Color.black)
                                            .bold()
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .fill(Color.white)
                                                        
                                                    )
                                            )
                                    }
                                }
                            ) .disabled(true)
                        }
                    }
                    
                    Spacer()
                }//VStack
                .padding()
                
            }
            
            
            // Posts
            ScrollView(showsIndicators: false) {
                ForEach(currentUserPosts) { post in
                    if let user = userDataViewModel.fetchUserById(post.createdBy) {
                        NavigationLink(destination: {
                            PostScreenView(postModel: post, userModel: user)
                        }) {
                            PostComponentView(postModel: post, userModel: user)
                        }
                        .buttonStyle(.plain)
                        Divider()
                    }
                }
            }
            
        } .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                if let uuid = UUID(uuidString: auth.currentUserId) {
                    if let user = userDataViewModel.fetchUserById(uuid) {
                        self.currentUser = user
                    }
                    self.currentUserPosts = userDataViewModel.posts.filter { post in
                        return post.createdBy == uuid
                    }
                }
            }
        }
        
    }
}
