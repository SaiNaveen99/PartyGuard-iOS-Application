//
//  AlertTableViewController.swift
//  Partyguard_iOS
//
//  Created by Somu,Vinod Reddy on 9/28/16.

//

import UIKit

class AlertTableViewController: UITableViewController {

    ///Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
    tableView.tableFooterView = UIView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    ///Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()// warning
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: - Table view data source
    /**
     This function defines number of sections in a tableview
     :param: tableview
     :returns: Number of sections
     */

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int { //table view
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    /**
     This function defines number of rows in each esction
     :returns: Number of rows
     */

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

  
    /**
     This function defines cell for each row
     :returns: Tableview cell
     */

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AlertCell", forIndexPath: indexPath)//for index and alert
        cell.textLabel!.text = "Katie Harris"//katie
        cell.detailTextLabel?.text = "Main Floor"//floor information
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        // Configure the cell...

        return cell
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
