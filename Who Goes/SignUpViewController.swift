//
//  SignUpViewController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 26/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit
import KBRoundedButton

class SignUpViewController: UIViewController {

    @IBOutlet weak var primaryButton: KBRoundedButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var confirmLabel: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Strings.SignUp.title
        
        setUpUI()
    }
    
    // MARK: Methods
    
    func setUpUI() {
        primaryButton.setTitle(Strings.SignUp.signUpAndLogin, forState: .Normal)
        usernameLabel.text = Strings.SignUp.username
        passwordLabel.text = Strings.SignUp.password
        confirmLabel.text = Strings.SignUp.confirmPassword
        usernameTextField.placeholder = Strings.SignUp.username.lowercaseString
        passwordTextField.placeholder = "******"
        confirmTextField.placeholder = "******"
    }
    
    func dismissModal() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: Actions
    
    @IBAction func primaryButtonTouched(sender: AnyObject) {
        dismissModal()
    }
}
