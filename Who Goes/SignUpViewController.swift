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
        
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
        
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
    
    func trySignUp() {
        guard let password = passwordTextField.text where password == confirmTextField.text else {
            Strings.SignUp.alertMessage.showAsAlert(target: self)
            return
        }
        
        primaryButton.working = true
        
        UserManager.signUp(usernameTextField.text ?? "", password: password) { (status, error) -> Void in
            self.primaryButton.working = false
            
            if let error = error?.localizedDescription {
                error.showAsAlert(target: self)
            }else{
                self.dismissModal()
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func primaryButtonTouched(sender: AnyObject) {
        trySignUp()
    }
}

extension SignUpViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
        } else if textField == passwordTextField {
            confirmTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}