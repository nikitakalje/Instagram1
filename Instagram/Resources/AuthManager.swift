//
//  AuthManager.swift
//  Instagram
//
//  Created by Nikita Kalje on 8/19/20.
//  Copyright © 2020 Nikita Kalje. All rights reserved.
//

import FirebaseDatabase
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    // MARK: public
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        //first check if username is available
        //then check email is available
        
        
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                
                // create account
                //then insert the account in the database
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    guard error == nil, result != nil else {
                        //Firebase auth unable to create an account
                        completion(false)
                        return
                    }
                    //insert in the database
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        }
                        else {
                            //could not insert in database
                            completion(false)
                            return
                        }
                    }
                }
            }
            else {
                //if username or email does not exsist
                completion(false)
            }
            
        }
        
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            //email log in
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }
        else if let username = username {
            //username log in
            print(username)
        }
    }
}
