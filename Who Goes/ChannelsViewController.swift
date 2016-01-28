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
    var channels = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.Channels.title
        
        setUpNavBar()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        checkPermissions()
    }

    // MARK: Methods
    
    func checkPermissions() {
        guard UserManager.hasUserAuthenticated() && UserManager.hasDeviceToken() else {
            
            UserManager.openPermissionAndLoginDialog(self)
            
            return
        }
        
        validated = true
    }
    
    func setUpNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addBarButtonTouched")
        navigationItem.rightBarButtonItem = addButton
    }
    
    func showAddDialog() {
        let alert = UIAlertController(title: Strings.Channels.addAlertTitle, message: Strings.Channels.addAlertMessage, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addAction(UIAlertAction(title: Strings.Channels.addAlertActionCancel, style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: Strings.Channels.addAlertActionSave, style: .Default, handler: { (action) -> Void in
            if let textFields = alert.textFields where textFields.count > 0 {
                if let text = textFields[0].text where !text.isEmpty {
                    self.saveChannel(text)
                }
            }
        }))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveChannel(channelName: String) {
        channels.append(channelName)
        print(channels)
    }
    
    // MARK: Actions
    
    func addBarButtonTouched() {
        showAddDialog()
    }
}
