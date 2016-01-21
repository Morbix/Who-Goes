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

let PUSH_PERMISSION_TITLE = "Push Permission".localized()
let RECEIVED_EVENTS_TITLE = "Received Events".localized()