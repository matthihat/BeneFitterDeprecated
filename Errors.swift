//
//  Errors.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-07-06.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import Foundation

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
    case invalidChallengeInfo
    
    var errorDescription: String? {
        switch self {
        case .uploadError:
            return "Error uploading challenge to server"
        case .invalidChallengeInfo:
            return "Error fetching valid challenge information from database"
        }
    }
}
