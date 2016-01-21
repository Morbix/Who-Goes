//
//  PushAuthorizationViewController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 21/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit
import KBRoundedButton

class PushAuthorizationViewController: UIViewController {

    @IBOutlet weak var primaryButton: KBRoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.PushPermission.title
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserManager.hasDeviceToken() {
            primaryButton.setTitle(Strings.PushPermission.buttonContinue, forState: .Normal)
        }else{
            primaryButton.setTitle(Strings.PushPermission.buttonAllow, forState: .Normal)
        }
    }
}
