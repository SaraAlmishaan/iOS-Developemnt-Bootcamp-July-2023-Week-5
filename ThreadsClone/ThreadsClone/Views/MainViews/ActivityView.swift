//  ActivityView.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

struct ActivityView: View {
    enum ActivityCategory : String, CaseIterable{
        case All
        case Replies
        case Mentions
        case Verified

        var title : String{
            switch self {
            case .All      : return "All"
            case .Replies  : return "Replies"
            case .Mentions : return "Mentions"
            case .Verified : return "Verified"
            }
        }
    }
    @EnvironmentObject var userDataViewModel : UserDataViewModel
    @State var CurrentSelected : ActivityCategory  = .All
    var body: some View {
        VStack{
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(ActivityCategory.allCases, id : \.self){ category in
                        Button(
                            action: {
                                CurrentSelected = category
                                
                            },
                            label: {
                                if CurrentSelected == category{
                                    Text(category.title)
                                       .frame(width:125 , height: 42 )
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
                                       .frame(width:125 , height: 42 )
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
            }

            
            ScrollView(showsIndicators: false){
                ForEach(userDataViewModel.users){ user in
                  HStack(alignment: .top){
                        
                      if let userImage = user.image{
                            AsyncImage(url : URL(string :userImage),
                                       content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 45, height: 45 )
                                    .cornerRadius(50)
                            },
                                       placeholder: {
                                ProgressView()
                            }
                            )
                        }
                 
                        VStack(alignment: .leading){
                            HStack(alignment: .top){
                                VStack(alignment: .leading){
                                    HStack{
                                        Text("Username")
                                            .bold()
                                        Image(systemName: "checkmark.seal.fill")
                                            .foregroundColor(Color.blue.opacity(0.7))
                                            .scaleEffect(0.8)
                                        Text("12s")
                                            .foregroundColor(Color.gray)
                                            .font(.subheadline)
                                    }.padding(.leading,-5)
                                    Text("Follow you")
                                        .foregroundColor(Color.gray)
                                        .font(.subheadline)
                                        .padding(.bottom)
                                }
                                Spacer()
                                Button(
                                    action: {
                                        
                                    },
                                    label: {
                                        Text("Follow")
                                             .padding(.vertical, 9)
                                             .padding(.horizontal, 29)
                                             .foregroundColor(Color.black)
                                             .bold()
                                             .overlay(
                                                 RoundedRectangle(cornerRadius: 10)
                                                 .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                               )
                                          
                                    }
                                )
                            }
                            Divider()
                        }.frame(maxWidth: .infinity, alignment: .leading)
       
                    }.padding(.top, 7)//HStack
                }//Loop
            }//ScrollView
        }.padding()

        
        
        
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
