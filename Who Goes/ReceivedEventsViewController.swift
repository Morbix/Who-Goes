//
//  ReceivedEventsViewController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 21/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit
import Parse

class ReceivedEventsViewController: UIViewController {

    var validated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.ReceivedEvents.title
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        guard UserManager.hasUserAuthenticated() && UserManager.hasDeviceToken() else {
            
            if let navController = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController(){
                presentViewController(navController, animated: true, completion: nil)
            }
            
            return
        }
        
        validated = true
    }

}
