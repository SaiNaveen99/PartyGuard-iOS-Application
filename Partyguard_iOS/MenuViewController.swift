//
//  MenuViewController.swift
//  Partyguard_iOS
//  Checking commit from Individual Account on MacBook
//  Created by Mallampati,Sai Naveen on 9/14/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    

   
    
    var MenuItem = ["Home","Profile","Log","Settings","Change Location"]

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
        return MenuItem.count+1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell1:ProfileTableViewCell
        var cell2:UITableViewCell
        if(indexPath.row == 0)
        {
            cell1 = tableView.dequeueReusableCellWithIdentifier("ProfileImageCell", forIndexPath: indexPath) as! ProfileTableViewCell
            cell1.profileImageView.layer.masksToBounds = false
            cell1.profileImageView.layer.cornerRadius = cell1.profileImageView!.frame.size.width/2
            cell1.profileImageView!.clipsToBounds = true
            cell1.profileImageView?.layer.borderWidth = 3.0
            cell1.profileImageView?.layer.borderColor = UIColor.blackColor().CGColor
            return cell1
            
        }
        else
        {
            cell2 = tableView.dequeueReusableCellWithIdentifier("MenuCellID", forIndexPath: indexPath)
            cell2.textLabel?.text = MenuItem[indexPath.row-1]
            return cell2
       
        
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
       
        if(indexPath.row == 2)
        {
            self.performSegueWithIdentifier("settingsID", sender: self)
        }
        print("Logout")
        if(indexPath.row == 5)
        {
            self.performSegueWithIdentifier("logOutID", sender: self)
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
