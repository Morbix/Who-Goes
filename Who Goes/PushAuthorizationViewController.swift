//
//  PushAuthorizationViewController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 21/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit
import KBRoundedButton
import SwiftyTimer

class PushAuthorizationViewController: UIViewController {

    @IBOutlet weak var primaryButton: KBRoundedButton!
    @IBOutlet weak var explanationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.PushPermission.title
        
        NSTimer.every(1.seconds) {
            self.updateState()
        }
    }
    
    // MARK: Methods
    
    func updateState(){
        if UserManager.hasDeviceToken() {
            primaryButton.setTitle(Strings.PushPermission.buttonContinue, forState: .Normal)
            explanationLabel.text = Strings.PushPermission.permissionGranted
        }else{
            primaryButton.setTitle(Strings.PushPermission.buttonAllow, forState: .Normal)
            explanationLabel.text = Strings.PushPermission.permissionExplanation
        }
    }
    
    func goToLogin(){
        performSegueWithIdentifier(Identifiers.Segues.Login, sender: nil)
    }
    
    func askForPermissions(){
        
    }
    
    // MARK: Actions
    
    @IBAction func primaryButtonTouched(sender: AnyObject) {
        if UserManager.hasDeviceToken() {
            goToLogin()
        }else{
            askForPermissions()
        }
    }
    
}
