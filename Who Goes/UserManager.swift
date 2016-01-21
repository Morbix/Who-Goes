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
        guard let token = PFInstallation.currentInstallation().deviceToken where !token.isEmpty else {
            return false
        }
        
        return true
    }
}