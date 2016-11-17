//
//  GuardAlertTableViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 10/16/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class GuardAlertTableViewController: UITableViewController {
    
    var basicuserNames:[String] = [String]()
    var issues:[String] = [String]()
    var nameSelected:String!

    override func viewDidLoad() {
        super.viewDidLoad()
 tableView.tableFooterView = UIView()
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
        return issues.count
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GuardAlerts", forIndexPath: indexPath)
        cell.textLabel!.text = basicuserNames[indexPath.row]
        cell.detailTextLabel?.text = issues[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        // Configure the cell...
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        nameSelected = basicuserNames[indexPath.row]
        print("Name selected \(nameSelected)")
        NSOperationQueue.mainQueue().addOperationWithBlock {self.performSegueWithIdentifier("GuardAlerttoClaim", sender: self)
        }
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("Name selected \(nameSelected)")
        if(segue.identifier == "GuardAlerttoClaim")
        {
         
            let guardissueclaimcontroller = segue.destinationViewController as! GuardIssueClaimViewController
             guardissueclaimcontroller.basicUserName  = nameSelected
        }
    }
    override func viewWillAppear(animated: Bool) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net//api/IssueList")!
        let request = NSMutableURLRequest(URL: url)
        
        request.HTTPMethod = "GET"
        request.setValue("Bearer \(appDelegate.accessToken)", forHTTPHeaderField: "Authorization")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
            if error != nil{
                print("Error -> \(error)")
                let alert1 = UIAlertView()
                alert1.title = "Invalid Login"
                alert1.message = "Username or password does not exists"
                alert1.addButtonWithTitle("Ok!")
                alert1.show()
                return
            }
            else
            {
                do
                {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [[String:AnyObject]]
                    
                   print("Issues")
                    
                    for(var i=0; i<result?.count; i++)
                    {

                        self.basicuserNames.append("\(result![i]["BasicUserProfileModel"]!["firstName"] as! String) \(result![i]["BasicUserProfileModel"]!["lastName"] as! String)")
                        self.issues.append(result![i]["issueName"] as! String)

                        
                    }
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        self.tableView.reloadData()
                    }
                    
                   
                }
                catch {
                    print("Error -> \(error)")
                }
                
                
                
                
            }
        }
        task.resume()
        
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
