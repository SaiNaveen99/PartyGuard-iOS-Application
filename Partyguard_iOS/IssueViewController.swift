//
//  IssueViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/19/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class IssueViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var Issues = ["Accident","FeelingUnsafe","Fight","Other"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load Functions")
        
        self.navigationItem.backBarButtonItem?.title = "Back"
        self.navigationItem.leftBarButtonItem?.title = "Back"
        self.navigationItem.title = "PartyGuard"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
         print("Number of Sections function")
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows function")
        return 5
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var  cell: UITableViewCell!
        print("Before loop")
        if (indexPath.row == 0)
        {
            print("Inside loop")
        cell = tableView.dequeueReusableCellWithIdentifier("faternity_cell", forIndexPath: indexPath)
        cell.textLabel?.text = "SigEp"
        cell.detailTextLabel?.text = "Sigma Phi Epsilon"
        cell.imageView?.image = UIImage(named: "SPE.gif")
        }
        else if(indexPath.row >= 1 && indexPath.row <= 4)
        {
           cell = tableView.dequeueReusableCellWithIdentifier("issue_cell", forIndexPath: indexPath)
            cell.textLabel?.text = Issues[indexPath.row]
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
       else if(indexPath.row == 5)
        {
            cell = tableView.dequeueReusableCellWithIdentifier("emergency_cell", forIndexPath: indexPath)
            cell.textLabel?.text = "EMERGENCY"
        }
        
        return cell
            
    
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
