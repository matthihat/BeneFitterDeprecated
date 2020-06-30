//
//  Constants.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-27.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import Foundation
import Firebase

let REF = Database.database().reference()
let REF_USERS = REF.child("users")
let REF_CHALLENGES = REF.child("challenges")
let REF_SELF_CHALLENGES = REF_CHALLENGES.child("self_challenges")

enum NetworkError: LocalizedError {
    case invalidUserInfo
    case errorCreatingUser
    case invalidData
    case userNotLoggedIn
    
    var errorDescription: String? {
        switch self {
        case .invalidUserInfo:
            return "Invalid user info provided, check that you have provided all necessary info"
        case .errorCreatingUser:
            return "Error creating user in database"
        case .invalidData:
            return "Invalid data!"
        case .userNotLoggedIn:
            return "User is not logged in"
        }
    }
}

enum ChallengeError: LocalizedError {
    case uploadError
    
    var errorDescription: String? {
        switch self {
        case .uploadError:
            return "Error uploading challenge to server"
        }
    }
}
