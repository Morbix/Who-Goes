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
        static let permissionGranted = "You've enabled the Push Notifications.".localized()
    }

    struct ReceivedEvents {
        static let title = "Received Events".localized()
    }

}

