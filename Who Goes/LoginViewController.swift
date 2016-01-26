//
//  LoginViewController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 21/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit
import KBRoundedButton

class LoginViewController: UIViewController {

    @IBOutlet weak var primaryButton: KBRoundedButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.Login.title
        
        setUpUI()
    }

    // MARK: Methods
    
    func setUpUI() {
        primaryButton.setTitle(Strings.Login.login, forState: .Normal)
        usernameLabel.text = Strings.Login.username
        passwordLabel.text = Strings.Login.password
        usernameTextField.placeholder = Strings.Login.username.lowercaseString
        passwordTextField.placeholder = "******"
    }
    
    // MARK: Actions
    
    @IBAction func primaryButtonTouched(sender: AnyObject) {
        
    }
}
