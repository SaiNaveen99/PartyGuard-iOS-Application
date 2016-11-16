//
//  MenuViewController.swift
//  Partyguard_iOS
//  Checking commit from Individual Account on MacBook
//  Created by Mallampati,Sai Naveen on 9/14/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    
    var MenuItem = ["Profile","Location Change","Alert Log","Logout"]

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.setHidesBackButton(true, animated: false)
        let backbutton = UIBarButtonItem()
        backbutton.image = UIImage(named: "Menu Filled-50.png")
        backbutton.style = .Bordered
        self.navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.leftBarButtonItem?.target = self
        self.navigationItem.leftBarButtonItem?.action = Selector("backmenu")
        
        

        // Do any additional setup after loading the view.
    }

    func backmenu() {
        print("backmenu pressed")
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window!.layer.addAnimation(transition, forKey: kCATransition)
        self.performSegueWithIdentifier("backmenuSegueToFraternity", sender: self)
        
    }
   func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cellIdentifier:String = ""
        if(indexPath.row == 0)
        {
            cellIdentifier = "ProfileImageCell"
        }
        else
        {
           cellIdentifier = "MenuCellID"
       
        
        }
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        if(cellIdentifier == "ProfileImageCell")
        {
             cell.imageView?.layer.masksToBounds = false
            cell.imageView!.layer.cornerRadius = cell.imageView!.frame.size.width/2
            cell.imageView!.clipsToBounds = true
            cell.imageView?.layer.borderWidth = 3.0
            cell.imageView?.layer.borderColor = UIColor.brownColor().CGColor
           
            
        }
        else
        {
            cell.textLabel?.text = MenuItem[indexPath.row-1]
            
        }
       
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        print("Logout")
        if(indexPath.row == 4)
        {
            self.performSegueWithIdentifier("LogoutBasic", sender: self)
        }
        if(indexPath.row == 1)
        {
            self.performSegueWithIdentifier("BasicUserProfileSegue", sender: self)
        }
        if(indexPath.row == 2)
        {
            self.performSegueWithIdentifier("locationChangeID", sender: self)
        }
        if(indexPath.row == 3)
        {
            self.performSegueWithIdentifier("alertLogID", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.row == 0)
        {
            return 250.00
        }
        return 50.00
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
