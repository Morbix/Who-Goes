//
//  ChannelsViewController.swift
//  Who Goes
//
//  Created by Henrique Morbin on 21/01/16.
//  Copyright © 2016 Morbix. All rights reserved.
//

import UIKit
import TableManager
import EZLoadingActivity

class ChannelsViewController: UIViewController {

    var validated = false
    var channels = [Channel]()
    @IBOutlet weak var __tableView: UITableView!
    lazy var tableManager : TableManager = TableManager(tableView: self.__tableView)
    let sectionYourChannels = Section()
    let sectionRegisteredChannels = Section()
    let sectionOtherChannels = Section()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = Strings.Channels.title
        
        setUpTable()
        setUpNavBar()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        checkPermissions()
        
        if validated {
            fetchChannelsFromCurrentUser()
        }
    }

    // MARK: SetUps
    
    func setUpTable() {
        sectionYourChannels.heightForStaticHeader = 26
        sectionRegisteredChannels.heightForStaticHeader = 26
        sectionOtherChannels.heightForStaticHeader = 26
        
        sectionYourChannels.titleForStaticHeader = Strings.Channels.yourChannels
        sectionRegisteredChannels.titleForStaticHeader = Strings.Channels.registeredChannels
        sectionOtherChannels.titleForStaticHeader = Strings.Channels.otherChannels
        
        sectionRegisteredChannels.visible = false
        sectionOtherChannels.visible = false
        
        tableManager.sections.append(sectionYourChannels)
        tableManager.sections.append(sectionRegisteredChannels)
        tableManager.sections.append(sectionOtherChannels)
    }
    
    func setUpNavBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addBarButtonTouched")
        navigationItem.rightBarButtonItem = addButton
    }
    
    // MARK: Methods
    
    func checkPermissions() {
        guard UserManager.hasUserAuthenticated() && UserManager.hasDeviceToken() else {
            
            validated = false 
            
            UserManager.openPermissionAndLoginDialog(self)
            
            return
        }
        
        validated = true
    }
    
    func showAddDialog() {
        let alert = UIAlertController(title: Strings.Channels.addAlertTitle, message: Strings.Channels.addAlertMessage, preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler(nil)
        alert.addAction(UIAlertAction(title: Strings.Channels.addAlertActionCancel, style: .Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: Strings.Channels.addAlertActionSave, style: .Default, handler: { (action) -> Void in
            if let textFields = alert.textFields where textFields.count > 0 {
                if let text = textFields[0].text where !text.isEmpty {
                    self.saveChannel(text)
                }
            }
        }))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveChannel(channelName: String) {
        
        EZLoadingActivity.show(Strings.LoadingActivity.saving, disableUI: true)
        
        Channel.saveNewChannel(withName: channelName) { (channel, error) -> Void in
            
            EZLoadingActivity.hide()
            
            guard let channel = channel else {
                if let error = error?.localizedDescription {
                    error.showAsAlert(target: self)
                }
                return
            }
            
            self.channels.append(channel)
            self.updateTableRows()
        }
    }
    
    func updateTableRows() {
        sectionYourChannels.rows.removeAll()
        
        for channel in channels {
            let row = Row(identifier: Identifiers.Cell.Channel, object: channel) { (object, cell, indexPath) -> Void in
                if let channel = object as? Channel  {
                    cell.textLabel?.text = channel.name
                    cell.detailTextLabel?.text = Strings.Channels.createdBy + (channel.createdBy.username ?? "undefined")
                }
            }
            row.didSelectRowAtIndexPath = { (row: Row, tableView: UITableView, indexPath: NSIndexPath) -> Void in
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
            }
            sectionYourChannels.rows.append(row)
        }
        
        tableManager.reloadData()
    }
    
    func fetchChannelsFromCurrentUser() {
        Channel.fetchChannelsFromCurrentUser { (objects, error) -> Void in
            guard let channels = objects as? [Channel] else {
                print("Remote results are not [Channel].")
                if let error = error?.localizedDescription {
                    error.showAsAlert(target: self)
                }
                return
            }
            
            self.channels.removeAll()
            self.channels.appendContentsOf(channels)
            
            self.updateTableRows()
        }
    }
    
    // MARK: Actions
    
    func addBarButtonTouched() {
        showAddDialog()
    }
}
