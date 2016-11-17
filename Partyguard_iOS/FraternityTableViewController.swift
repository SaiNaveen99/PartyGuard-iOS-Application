
//
//  FraternityTableViewController.swift
//  Partyguard_iOS
//
//  Created by Somu,Vinod Reddy on 9/7/16.
//  Copyright 2016 BashGuardians. All rights reserved.
//

import UIKit


class FraternityTableViewController: UITableViewController {


    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    var fraternitySelected:String = "abc"
    var Fraternities:[String] = ["sigmaphi"]
    var subtitles:[String] = ["sigma"]
    var Icons = ["SPE.gif","TKE.gif","PDT.gif","PSK1.png","DC.png","AKL.png"]
    
    
    
    
    override func viewDidLoad() {
                super.viewDidLoad()
        
      
            }
    
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
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
                print("Fraternity List \(response)")
                do
                {
                    
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [[String:AnyObject]]
                    
                    for(var i=0; i<result?.count; i++)
                 {
                  
                    self.Fraternities[i] = result![i]["fraternityName"] as! String
                    self.subtitles[i] = result![i]["nickName"] as! String
                   
                }
                    
                    print(self.Fraternities)
                    print(self.subtitles
                    )
                  
                }
                catch {
                    print("Error -> \(error)")
                }
                
                
            }
        }
        task.resume()
        dispatch_async(dispatch_get_main_queue()) {
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    @IBAction func onClickMenuBarButton(sender: UIBarButtonItem) {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        view.window!.layer.addAnimation(transition, forKey: kCATransition)
        self.performSegueWithIdentifier("menuSegueFromFraternity", sender: self)
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("count in number of rows \(Fraternities.count)")
        return Fraternities.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FraternityCell", forIndexPath: indexPath)
        cell.textLabel?.text = Fraternities[indexPath.row]
        cell.detailTextLabel?.text = subtitles[indexPath.row]
        cell.imageView?.image = UIImage(named: Icons[indexPath.row])
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        // Configure the cell...
      
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        fraternitySelected = Fraternities[indexPath.row]
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "FraternityToIssueSegue")
        {
        let ivc = segue.destinationViewController as! IssueTableViewController
        ivc.fraternitytext = fraternitySelected
        }
        
    }
    
    
    
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
 
  

    
}
