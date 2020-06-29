//
//  User.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-28.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import Foundation

struct User {
    let uid: String
    let fullname: String
//    let pendingChallenges: [PendingChallenge]?
    let activeChallenges: [ActiveChallenge]?
//    let finishedChallenges: [FinishedChallenge]?
    
    init(_ uid: String, _ fullname: String, _ activeChallenges: [ActiveChallenge]?) {
        self.uid = uid
        self.fullname = fullname
//        self.pendingChallenges = pendingChallenges
        self.activeChallenges = activeChallenges
//        self.finishedChallenges = finishedChallenges
    }
}
