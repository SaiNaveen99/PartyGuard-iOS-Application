//
//  IssueTableViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/28/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class IssueTableViewController: UITableViewController {
    
    var Issues = ["Accident","FeelingUnsafe","Fight","Other"]

    override func viewDidLoad() {
        super.viewDidLoad()
              print("Issue Table View Controller")
        self.navigationItem.title = "PartyGuard"
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
       
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Issue_cell", forIndexPath: indexPath)

        if (indexPath.row == 0)
        {
            print("Inside loop")
            
            cell.textLabel?.text = "SigEp"
            cell.detailTextLabel?.text = "Sigma Phi Epsilon"
            cell.imageView?.image = UIImage(named: "SPE.gif")
        }
        else if(indexPath.row >= 1 && indexPath.row <= 4)
        {
                       cell.textLabel?.text = Issues[indexPath.row-1]
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        else if(indexPath.row == 5)
        {
            
            cell.textLabel?.text = "EMERGENCY"
            cell.backgroundColor = UIColor(red: 185.0/255.0, green: 0.0/255.0, blue: 35.0/255.0, alpha: 1.0)
            cell.textLabel?.textAlignment = .Center
        }

        

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let tableHeight = self.tableView.bounds.height
        
        let cellHeight:CGFloat = tableHeight/7.0
        
        return cellHeight
    }
    
}
