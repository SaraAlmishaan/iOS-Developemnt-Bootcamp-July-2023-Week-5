//  NewPostView.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

struct NewPostView: View {
    @EnvironmentObject var userDataViewModel : UserDataViewModel
    @State var postText : String = ""
    var body: some View {
        VStack{
//            ZStack{
//                Button(
//                    action: {
//
//                    },
//                    label: {
//                        Text("Cancel")
//                             .foregroundColor(Color.black)
//                    }
//                 ).frame(maxWidth: .infinity, alignment: .leading)
//
//                Text("New Thread")
//                    .bold()
//                    .font(.title3)
//
//            }.padding(.bottom, 11)
//            Divider()
            
            HStack(alignment: .top){
       
                if let userImage = userDataViewModel.users.randomElement()!.image{
                    AsyncImage(url : URL(string :userImage),
                        content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 45, height: 45 )
                            .cornerRadius(50)
                        Rectangle()
                            .frame(width: 2, height: 60, alignment:.leading)
                            .foregroundColor(.gray.opacity(0.3))
                        image.resizable()
                            .blur(radius: 2)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25 )
                            .cornerRadius(50)
                    }, placeholder: {
                        ProgressView()
                    }
                    )
                }
                
                VStack(alignment: .leading){
                        Text("Username")
                            .bold()
                            .padding(.bottom, -2)
                        TextField( "Start a thread...", text: $postText, axis: .vertical)
                        Button(
                            action: {
                                
                            },
                            label: {
                                Image(systemName: "paperclip")
                                    .foregroundColor(Color.gray.opacity(0.9))
                                    .scaleEffect(1.2)
                            }
                        )
                        .padding(.top)
                }
                
          }
          Spacer()
          HStack{
              Button(
                    action: {
                     
                     },
                    label: {
                         Text("Anyone can reply")
                             .foregroundColor(Color.gray.opacity(0.8))
                  }
                 )
              Spacer()
              Button(
                    action: {
                     
                    },
                    label: {
                        Text("Post")
                            .bold()
                            .foregroundColor(Color.blue.opacity(0.4))
                          
                    }
                )
            }
        }.padding()
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
