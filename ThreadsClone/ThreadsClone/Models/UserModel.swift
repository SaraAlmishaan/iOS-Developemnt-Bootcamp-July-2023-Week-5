//  UserModel.swift
//  ThreadsClone
//  Created by Sara on 23/08/2023.
import Foundation

struct UserModel : Identifiable {
    typealias ID = UUID
    let id: ID = .init()
    var userName : String
    var fullName : String?
    var bio : String?
    var image : String?
    var followers : Array<UserModel.ID>
    var following : Array<UserModel.ID>
    var posts : Array<PostModel.ID>
}

