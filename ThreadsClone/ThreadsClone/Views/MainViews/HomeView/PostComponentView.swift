//  PostComponent.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

struct PostComponentView: View {
    @EnvironmentObject var auth: AuthViewModel
    let postModel : PostModel
    let userModel : UserModel
    var body: some View {
        HStack{
                VStack{
                    if let userImage = userModel.image {
                        AsyncImage(url : URL(string :userImage),
                                   content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .cornerRadius(50)
                        },
                         placeholder: {
                            ProgressView()
                        }
                       )
                    }else{
                        
                    }
                    Spacer()
                 }
                VStack{
                    
                    HStack{
                       Text(userModel.userName)
                                .bold()
                                .padding(-2)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(Color.blue.opacity(0.7))
                            .scaleEffect(0.8)
                        Spacer()
                        Text("0 m")
                            foregroundColor(Color.gray.opacity(0.7))
                        Image( systemName : "ellipsis")
                            .foregroundColor(Color.black.opacity(0.7))
                            .padding(8)
                    }
                    .padding(.bottom,-6)
                   if let content = postModel.content{
                            Text(content)
                              .multilineTextAlignment(.leading)
                        
                    }
                    
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack{
                            ForEach(postModel.attachments, id : \.self){ item in
                                 AsyncImage( url : item,
                                   content: { image in
                                      image.resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 300, height: 200)
                                        .cornerRadius(12)
                                   },
                                   placeholder: {
                                      ProgressView()
                                   }
                                 )
                            }
                        }
                    }
                    
                    HStack{
                        Button(
                            action: {
                                
                            },
                            label: {
//                               if postModel.likes.contains(UUID(uuidString: auth.currentUserId)!){
//                                    Image(systemName: "heart.fill")
//
//                                } else {
                                    Image(systemName: "heart")
//                                }
                                  
                            }
                        )
                        
                        Button(
                            action: {
                                
                            },
                            label: {
                                Image(systemName: "bubble.right")
                                  
                            }
                        )
                        
                        Button(
                            action: {
                                
                            },
                            label: {
                                Image(systemName: "arrow.2.squarepath")
                                  
                            }
                        )
                        
                        Button(
                            action: {
                                
                            },
                            label: {
                                Image(systemName: "paperplane")
                                  
                            }
                        )
                    } .scaleEffect(1.2)
                      .foregroundColor(Color.black)
                      .frame(width: 320, height: 30, alignment: .leading)
                      
                   
                    Text("\(postModel.replies.count) replies・\(postModel.likes.count) likes")
                    .padding(.horizontal,-168)
                    .padding(.vertical, -10)
                    .foregroundColor(Color.gray)
                 
                }
          
        }.padding()       
    }
}


