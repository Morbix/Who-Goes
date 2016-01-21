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
    
    let application = UIApplication.sharedApplication()
    var askedForPermissions = false {
        didSet {
            self.primaryButton.working = askedForPermissions
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.PushPermission.title
        
        NSTimer.every(3.seconds) {
            self.updateState()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.updateState()
    }
    
    // MARK: Methods
    
    func updateState(){
        if UserManager.hasDeviceToken() {
            
            askedForPermissions = false
            
            primaryButton.setTitle(Strings.PushPermission.buttonContinue, forState: .Normal)
            explanationLabel.text = Strings.PushPermission.permissionGranted
        }else if !askedForPermissions {
            primaryButton.setTitle(Strings.PushPermission.buttonAllow, forState: .Normal)
            explanationLabel.text = Strings.PushPermission.permissionExplanation
        }
    }
    
    func goToLogin(){
        performSegueWithIdentifier(Identifiers.Segues.Login, sender: nil)
    }
    
    func askForPermissions(){
        let userNotificationTypes: UIUserNotificationType = [.Alert, .Badge, .Sound]
        let settings = UIUserNotificationSettings(forTypes: userNotificationTypes, categories: nil)
        
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        askedForPermissions = true
        
        NSTimer.after(10.seconds) {
            self.askedForPermissions = false
            self.showAlert(withTitle: Strings.PushPermission.alertTitle, message: Strings.PushPermission.alertMessage)
        }
    }
    
    func showAlert(withTitle title : String, message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: Strings.PushPermission.alertActionOk, style: .Default, handler: nil))
        alert.addAction(UIAlertAction(title: Strings.PushPermission.alertActionSettings, style: .Default) {
            (_) -> Void in
            if let url = NSURL(string: UIApplicationOpenSettingsURLString) {
                UIApplication.sharedApplication().openURL(url)
            }
        })
        presentViewController(alert, animated: true, completion: nil)
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
