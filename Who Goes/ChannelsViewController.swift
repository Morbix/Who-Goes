//
//  ChannelsViewController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 21/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit

class ChannelsViewController: UIViewController {

    var validated = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.Channels.title
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        checkPermissions()
    }

    // MARK: Methods
    
    func checkPermissions() {
        guard UserManager.hasUserAuthenticated() && UserManager.hasDeviceToken() else {
            
            openPermissionAndLoginDialog()
            
            return
        }
        
        validated = true
    }
    
    func openPermissionAndLoginDialog() {
        if let navController = UIStoryboard(name: Identifiers.StoryboardName.Login, bundle: nil).instantiateInitialViewController(){
            presentViewController(navController, animated: true, completion: nil)
        }
    }

}
