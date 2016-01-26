//
//  Strings.swift
//  Who Goes
//
//  Created by Henrique Morbin on 21/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: self)
    }
}

struct Strings {
    struct PushPermission {
        static let title = "Push Permission".localized()
        static let buttonAllow = "Yes, I would.".localized()
        static let buttonContinue = "Proceed".localized()
        static let permissionExplanation = "Would you like to be notified when your friends are calling you for some special occasion?".localized()
        static let permissionGranted = "You've enabled Notifications.".localized()
        static let alertTitle = "Failed".localized()
        static let alertMessage = "We couldn't enable Notifications. Go to Settings app and verify if you have denied the Notifications for 'Who Goes?'.".localized()
        static let alertActionOk = "Ok".localized()
        static let alertActionSettings = "Settings".localized()
    }

    struct ReceivedEvents {
        static let title = "Received Events".localized()
    }

    struct Login {
        static let title = "Login".localized()
        static let login = "Login".localized()
        static let signUp = "Sign Up".localized()
        static let username = "Username".localized()
        static let password = "Password".localized()
    }
    
    struct SignUp {
        static let title = "Sign Up".localized()
        static let signUpAndLogin = "Sign Up & Login".localized()
        static let username = "Username".localized()
        static let password = "Password".localized()
        static let confirmPassword = "Confirm Password".localized()
    }
}

