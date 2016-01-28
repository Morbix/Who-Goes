//
//  Channel.swift
//  Who Goes
//
//  Created by Henrique Morbin on 28/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit
import Parse

class Channel: PFObject {
    
    @NSManaged var name: String
    @NSManaged var createdBy: PFUser
    
    // MARK: Methods
    
    static func saveNewChannel(withName name: String, block: (Channel, NSError?) -> Void) {
        
        guard let user = PFUser.currentUser() else {
            return
        }
        
        let newChannel = Channel()
        newChannel.name = name
        newChannel.createdBy = user
        
        let acl = PFACL()
        acl.publicReadAccess = true
        acl.publicWriteAccess = false
        acl.setWriteAccess(true, forUser: user)
        newChannel.ACL = acl
        
        newChannel.saveInBackgroundWithBlock { (status, error) -> Void in
            block(newChannel, error)
        }
    }
}

extension Channel : PFSubclassing {
    override class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "Channel"
    }
}