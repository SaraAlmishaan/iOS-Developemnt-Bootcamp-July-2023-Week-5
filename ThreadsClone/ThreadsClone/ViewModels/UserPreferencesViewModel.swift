//  UserPreferencesViewModel.swift
//  ThreadsClone
//  Created by Sara on 20/08/2023.
import Foundation
import SwiftUI

class UserPreferencesViewModel: ObservableObject{
    @AppStorage("userSessionToken") var token: String = ""
}
