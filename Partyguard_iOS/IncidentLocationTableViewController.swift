//
//  IncidentLocationTableViewController.swift
//  Partyguard_iOS
//
//  Created by BashGuardians on 9/22/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class IncidentLocationTableViewController: UITableViewController {
    
    var fraternitySelected:String = "abc"
    var issueSelected:String = "abc"

    var incidentLocation = ["Upstairs","Main Floor","Basement","Deck"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return incidentLocation.count+2
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IncidentLocationCellID", forIndexPath: indexPath)
        if (indexPath.row == 0)
        {
            print("Inside loop")
            
            cell.textLabel?.text = fraternitySelected
            cell.detailTextLabel?.text = "Sigma Phi Epsilon"
            cell.imageView?.image = UIImage(named: "SPE.gif")
        }
        else if(indexPath.row == 1)
        {
            cell.textLabel?.text = issueSelected
             cell.backgroundColor = UIColor.lightGrayColor()
            
        }
        else if(indexPath.row >= 2 && indexPath.row <= 5)
        {
         cell.textLabel?.text = incidentLocation[indexPath.row-2]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
       cell.backgroundColor = UIColor.grayColor()
            
    }
    

        return cell
    }
 
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let tableHeight = self.tableView.bounds.height
        
        let cellHeight:CGFloat = tableHeight/6.5
        
        return cellHeight
    }
        override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            
                 }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
