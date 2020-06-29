//
//  Service.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-27.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import Foundation
import Firebase

struct UserService {
    
    static let shared = UserService()
    
    func signUpUserWithEmail(_ email: String, _ password: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            
            if let error = err {
                completion(.failure(error))
                return
            }
            
            completion(.success(true))
        }
    }
    
    func uploadUserInfo(fullname: String, completion: @escaping(Result<Bool, Error>) -> Void) {
        
        guard
            let uid = Auth.auth().currentUser?.uid
            else {
            completion(.failure(NetworkError.invalidData))
            return
        }
        
        let uploadValues = ["fullname":fullname]
        
        REF_USERS.child(uid).updateChildValues(uploadValues) { (err, ref) in
            
            if let error = err {
                completion(.failure(error))
                return
            }
            
            completion(.success(true))
        }
    }
    
    func fetchUsers(completion: @escaping(Result<User, Error>) -> Void) {
        
        guard let uid = Auth.auth().currentUser?.uid
            else { completion(.failure(NetworkError.userNotLoggedIn)); return }
        
        REF_USERS.observeSingleEvent(of: .value) { (snapshot) in
            guard let allObjects = snapshot.children.allObjects as? [DataSnapshot] else {
                completion(.failure(NetworkError.invalidData))
                return
            }
            
            allObjects.forEach { (snapshot) in
                let uid = snapshot.key
                
                REF_USERS.child(uid).observeSingleEvent(of: .value) { (snapshot) in
                    guard let dictionary = snapshot.value as? Dictionary<String, AnyObject> else {
                        completion(.failure(NetworkError.errorCreatingUser))
                        return
                    }
                    
                    guard let fullname = dictionary["fullname"] as? String else {
                        completion(.failure(NetworkError.invalidUserInfo))
                        return
                    }
                    
                    let user = User(uid, fullname, nil)
                    
                    completion(.success(user))
                }
            }
        }
    }
}
