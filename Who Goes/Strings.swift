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
        static let buttonAllow = "Allow".localized()
        static let buttonContinue = "Continue".localized()
    }
    
    struct ReceivedEvents {
        static let title = "Received Events".localized()
    }

}

