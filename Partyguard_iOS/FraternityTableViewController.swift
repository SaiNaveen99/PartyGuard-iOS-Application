
//
//  FraternityTableViewController.swift
//  Partyguard_iOS
//
//  Created by Somu,Vinod Reddy on 9/7/16.
//  Copyright 2016 BashGuardians. All rights reserved.
//

import UIKit


class FraternityTableViewController: UITableViewController {


    ///This variable holds the menubar button
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    ///This variable holds the fraternity that user selected
    var fraternitySelected:String!
    ///This is an array variable that holds list of fraternities that comes from web service
    var Fraternities:[String] = [String]()
    ///This is an array variable that holds the list of sub titles for the fraternities
    var subtitles:[String] = [String]()
   
    ///This variable holds the instance of an AppDelegate
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
     ///Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
                super.viewDidLoad()
        
      
            }
    
    /**
     This function triggered everytime the view appears
     :param: animated  Is a boolean variable
     */

    override func viewWillAppear(animated: Bool) {
        
        
        let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/FraternityList")!
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.setValue("Bearer \(appDelegate.accessToken)", forHTTPHeaderField: "Authorization")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
            if error != nil{
                print("Error -> \(error)")
                let alert1 = UIAlertView()
                alert1.title = "Invalid Login"
                alert1.message = "Username or password is incorrect"
                alert1.addButtonWithTitle("Okay!")
                alert1.show()
                return
            }
            else
            {
                
                do
                {
                    
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [[String:AnyObject]]
                    self.Fraternities = [String]()
                    for(var i=0; i<result?.count; i++)
                    {
                        
                        self.Fraternities.append(result![i]["fraternityName"] as! String)
                        self.subtitles.append(result![i]["nickName"] as! String)
                        
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
    ///Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
     This function is triggered when user clicks on menu button
     :param: sender Is an UIBarButtonItem
     
     */
    @IBAction func onClickMenuBarButton(sender: UIBarButtonItem) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.addAnimation(transition, forKey: kCATransition)
        self.performSegueWithIdentifier("menuSegueFromFraternity", sender: self)
    }
    
    /**
     This function defines number of rows in each esction
     :returns: Number of rows
     */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("count in number of rows \(Fraternities.count)")
        return Fraternities.count
    }
    /**
     This function defines cell for each row
     :returns: Tableview cell
     */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FraternityCell", forIndexPath: indexPath)
        cell.textLabel?.text = Fraternities[indexPath.row]
        cell.detailTextLabel?.text = subtitles[indexPath.row]
       
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        // Configure the cell...
      
        return cell
        
    }
    /**
     This function defines what has to happen when user clicks on the tableview cell at particular index
     */
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        fraternitySelected = Fraternities[indexPath.row]
        print("Fraternity Selected in did select row \(fraternitySelected)")
       
        self.performSegueWithIdentifier("FraternityToIssue", sender: nil)
        
        
        
    }
    /**
     This function carries data over segue from one ViewController to another ViewController
     
     :param: segue Is a UIStoryboardSegue, sender It can be anyObject
     
     */
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "FraternityToIssue")
        {
           appDelegate.fraternitySelected = self.fraternitySelected
        }
        
    }
    
    
    
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
 
  

    
}
