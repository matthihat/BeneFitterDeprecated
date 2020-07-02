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

enum TypeOfChallenge: String {
    case mostCaloriesBurnt
    case maxSteps
}

enum ChallengeGoal {
    case mostCaloriesBurnt
    case maxSteps
    
    var topChallengeGoal: Int {
        switch self {
        case .maxSteps:
            return 10000
        case .mostCaloriesBurnt:
            return 500
        }
    }
    
    var topChallengeBet: Int {
        switch self {
        case .maxSteps:
            return 20
        case .mostCaloriesBurnt:
            return 20
        }
    }
    
    var topChallengeDescription: String {
        switch self {
        case .mostCaloriesBurnt:
            return "calories"
        case .maxSteps:
            return "steps"
        }
    }
}

enum Duration {
    case twentyFourHours
    
    var durationInSeconds: TimeInterval {
        switch self {
        case .twentyFourHours:
            return 60*60*24
        }
    }
    
    var durationInHours: Int {
        switch self {
        case .twentyFourHours:
            return 24
        }
    }
}

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
