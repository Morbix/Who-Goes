//
//  StringExtension.swift
//  Who Goes
//
//  Created by Henrique Morbin on 26/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit

extension String {
    func showAsAlert(target target: UIViewController) {
        print("Alert: " + self)
        
        let alert = UIAlertController(title: "Who Goes?", message: self, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        target.presentViewController(alert, animated: true, completion: nil)
    }
}