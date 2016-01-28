//
//  MainTabBarController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 28/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        guard let items = self.tabBar.items else {
            return
        }
        
        assert(items.count == 3, "The number of items in TabBar was changed. You must update the code below to avoid chashes")
        
        items[0].title = Strings.ReceivedEvents.title
        items[1].title = Strings.Channels.title
        items[2].title = Strings.Settings.title
    }

    
}
