//
//  UserManager.swift
//  Who Goes
//
//  Created by Henrique Morbin on 21/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import Foundation
import Parse

class UserManager {
    static func hasUserAuthenticated() -> Bool {
        guard let user = PFUser.currentUser() where user.authenticated else {
            return false
        }
        
        return true
    }
    
    static func hasDeviceToken() -> Bool {
        
        // TODO: Forcing return to work in the simulator
        return true
        
        guard let token = PFInstallation.currentInstallation().deviceToken where !token.isEmpty else {
            return false
        }
        
        return true
    }
    
    static func logout(block: PFUserLogoutResultBlock) {
        PFUser.logOutInBackgroundWithBlock(block)
    }
    
    
    static func login(username: String, password: String, block: PFUserResultBlock) {
        PFUser.logInWithUsernameInBackground(username, password: password, block: block)
    }
    
    static func signUp(username: String, password: String, block: PFBooleanResultBlock) {
        let newUser = PFUser()
        
        newUser.username = username
        newUser.password = password
        
        newUser.signUpInBackgroundWithBlock(block)
    }
}