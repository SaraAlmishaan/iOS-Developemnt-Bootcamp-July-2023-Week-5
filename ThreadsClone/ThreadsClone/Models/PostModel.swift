//  PostModel.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import Foundation

struct PostModel : Identifiable {
    typealias ID = UUID
    let id: ID = .init()
    let content : String?
    let attachments : Array<URL>
    var likes : Array<UserModel.ID>
    var replies : Array<PostModel.ID>
    let createdAt : Date
    let createdBy : UserModel.ID
}


 


