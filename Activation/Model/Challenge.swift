//
//  Challenge.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-21.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import Foundation
import Firebase

enum TypeOfChallenge: String {
    case mostCaloriesBurnt
    case maxSteps
}

enum Duration {
    case twentyFourHours
    
    var durationInSeconds: TimeInterval {
        switch self {
        case .twentyFourHours:
            return 60*60*24
        }
    }
}

protocol SelfChallengeInterface {
    var challengeId: String { get }
    var challengeType: TypeOfChallenge { get }
    var duration: Duration { get }
    var startDate: Date { get}
    var endDate: Date { get}
    var bettingAmount: Int { get }
    
    func postChallenge(completion: @escaping (Result<Bool, Error>) -> Void)
    
}

struct SelfChallenge: SelfChallengeInterface {
    var challengeId: String {
        return UUID().uuidString
    }
    
    var challengeType: TypeOfChallenge
    var duration: Duration
    var startDate: Date {
        return Date()
    }
    
    var endDate: Date {
        let newDate = startDate
        let endDate = newDate.addingTimeInterval(duration.durationInSeconds)
        return endDate
    }
    
    var bettingAmount: Int
    
    func postChallenge(completion: @escaping (Result<Bool, Error>) -> Void) {
        
        let challengeType_String = challengeType.rawValue
        let durationInSeconds = Int(duration.durationInSeconds)
        let startDateString = startDate.description
        let endDateString = endDate.description
        guard let currentUserUid = Auth.auth().currentUser?.uid else {
            completion(.failure(ChallengeError.uploadError))
            return
        }
        
        let uploadValues: [String:Any] =
                            ["challenge_type" : challengeType_String,
                            "duration_seconds" : durationInSeconds,
                            "start_date" : startDateString,
                            "end_date" : endDateString,
                            "betting_amount" : bettingAmount
                            ]
        
//        upload to challenge ref
        REF_SELF_CHALLENGES.child(self.challengeId).updateChildValues(uploadValues) { (err, ref) in
            
            if let error = err {
                completion(.failure(error))
                return
            }
            
            let uploadValues2 = [self.challengeId:1]
            
//            upload challenge id to user ref
            REF_USERS.child(currentUserUid).child("challenges").child("self_challenges").updateChildValues(uploadValues2) { (err, ref) in
                
                if let error = err {
                    completion(.failure(error))
                    return
                }
                
                completion(.success(true))
            }
        }
    }
    
    
}
//
//protocol PendingChallengeInterface {
//    var challengeId: UUID { get }
//    var challengeType: TypeOfChallenge { get }
//    var initializedByUserWithUid: String { get }
//    var challengedUserUid: String { get }
//    var duration: Duration { get }
//
//    func postPendingChallenge(_ challengeId: UUID, _ challengeType: TypeOfChallenge, _ initializedByUserWithUid: String, _ challengedUserUid: String, _ duration: Duration, completion: @escaping(Result<Bool, Error>) -> Void)
//
//
//
//    func activeChallenge(_ challengeId: UUID, _ challengeType: TypeOfChallenge, _ initializedByUserWithUid: String, _ acceptedByUserWithUid: String, _ startDate: Date, _ endDate: Date, _ duration: Duration) -> ActiveChallenge
//
//}
//
//protocol ActiveChallengeInterface {
//    var challengeId: UUID { get }
//    var challengeType: TypeOfChallenge { get }
//    var initializedByUserWithUid: String { get }
//    var acceptedByUserWithUid: String { get }
//    var startDate: Date { get }
//    var endDate: Date { get }
//    var duration: Duration { get }
//}
//
//struct PendingChallenge: PendingChallengeInterface {
//    func postPendingChallenge(_ challengeId: UUID, _ challengeType: TypeOfChallenge, _ initializedByUserWithUid: String, _ challengedUserUid: String, _ duration: Duration, completion: (Result<Bool, Error>) -> Void) {
//        completion(.success(true))
//    }
//
//    var challengedUserUid: String
//
//    let challengeId: UUID
//    let challengeType: TypeOfChallenge
//    let initializedByUserWithUid: String
//    let duration: Duration
//
//    func activeChallenge(_ challengeId: UUID, _ challengeType: TypeOfChallenge, _ initializedByUserWithUid: String, _ acceptedByUserWithUid: String, _ startDate: Date, _ endDate: Date, _ duration: Duration) -> ActiveChallenge {
//
////        do something to acquire accepted challenge
//
//        return ActiveChallenge(challengeId: challengeId,
//                                 challengeType: challengeType,
//                                 initializedByUserWithUid: initializedByUserWithUid,
//                                 acceptedByUserWithUid: acceptedByUserWithUid,
//                                 startDate: startDate,
//                                 endDate: endDate,
//                                 duration: duration)
//    }
//}
//
//struct ActiveChallenge: ActiveChallengeInterface {
//    let challengeId: UUID
//    let challengeType: TypeOfChallenge
//    let initializedByUserWithUid: String
//    let acceptedByUserWithUid: String
//    let startDate: Date
//    let endDate: Date
//    let duration: Duration
//
//
//}

//struct FinishedChallenge: ActiveChallengeInterface {
//    let challengeId: UUID
//    let challengeType: TypeOfChallenge
//    let initializedByUserWithUid: String
//    let acceptedByUserWithUid: String
//    let startDate: Date
//    let endDate: Date
//    let duration: Duration
//    
//    
//}

