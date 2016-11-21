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
    
    ///This variable holds the issue the user selected
    var issueSelected:String!
 ///This variable holds the instance of the AppDelegate 
     let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
     ///Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
              print("Issue Table View Controller")
        self.navigationItem.title = "PartyGuard"
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
       
            }
///Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /**
     This function is triggered everytime view appears
     :param: animated  Is a boolean type
     */
    override func viewWillAppear(animated: Bool) {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
        }


        
    }
    /**
     This function defines number of sections in a tableview
     :param: tableview
     :returns: Number of sections
     */

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    /**
     This function defines number of rows in each esction
     :returns: Number of rows
     */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    /**
     This function defines cell for each row
     :returns: Tableview cell
     */

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Issue_cell", forIndexPath: indexPath)

        if (indexPath.row == 0)
        {
           
            cell.textLabel?.text = appDelegate.fraternitySelected
            
           
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
    /**
     This function defines what has to happen when user clicks on the tableview cell at particular index
     */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        issueSelected = Issues[indexPath.row-1]
        self.performSegueWithIdentifier("IssueToIncident", sender: nil)
    }
    /**
     This function carries data over segue from one ViewController to another ViewController
     
     :param: segue Is a UIStoryboardSegue, sender It can be anyObject
     
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "IssueToIncident")
        {
            appDelegate.issueSelected = self.issueSelected
        
            }
        
        
    }
    /**
     This function defines height of cell at particular row
     :returns: Float value
     */
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let tableHeight = self.tableView.bounds.height
        
        let cellHeight:CGFloat = tableHeight/6.5
        
        return cellHeight
    }
    
}
