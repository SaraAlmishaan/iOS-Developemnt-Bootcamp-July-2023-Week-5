//  SearchView.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import SwiftUI

struct SearchView: View {
    @EnvironmentObject var userDataViewModel : UserDataViewModel
    @State var searchedText : String = ""
    var body: some View {
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.gray)
                    .padding(.leading, 4)
                TextField( "Search", text: $searchedText)
                    .frame(height: 40)
            }
            .padding(.vertical, 3)
            .padding(.horizontal, 4)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(12)
            
           ScrollView(showsIndicators: false){
               ForEach(userDataViewModel.users){ user in
                  HStack(alignment: .top){
                        
                      if let userImage = user.image {
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
                                    }
                                    Text("First, last names")
                                        .foregroundColor(Color.gray)
                                        .font(.title3)
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
                            Text("12 followers")
                                .padding(.leading, 4)
                                .padding(.bottom, 8)
                            Divider()
                        }.frame(maxWidth: .infinity, alignment: .leading)
       
                    }.padding(.top, 7)
                }//Loop
            }//ScrollView
        }.padding()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
