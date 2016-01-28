//
//  SettingsViewController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 28/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit
import KBRoundedButton

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var authenticationButton: KBRoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.Settings.title
        
        updateState()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        updateState()
    }

    // MARK: Methods
    func updateState(){
        if UserManager.hasUserAuthenticated() {
            authenticationButton.setTitle(Strings.Settings.logout, forState: .Normal)
        } else {
            authenticationButton.setTitle(Strings.Settings.login, forState: .Normal)
        }
    }
    
    func logOut() {
        UserManager.logout({ (error) -> Void in
            self.updateState()
        })
    }
    
    func openPermissionAndLoginDialog() {
        if let navController = UIStoryboard(name: Identifiers.StoryboardName.Login, bundle: nil).instantiateInitialViewController(){
            presentViewController(navController, animated: true, completion: nil)
        }
    }
    
    // MARK: Actions
    @IBAction func authenticationTouched(sender: AnyObject) {
        if UserManager.hasUserAuthenticated() {
            logOut()
        } else {
            openPermissionAndLoginDialog()
        }
    }
}
