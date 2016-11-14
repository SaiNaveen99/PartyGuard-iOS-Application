//
//  MenuViewController.swift
//  Partyguard_iOS
//  Checking commit from Individual Account on MacBook
//  Created by Mallampati,Sai Naveen on 9/14/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    var MenuItem = ["Profile","Location Change","Logout","Settings","About PartyGuard"]

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.clipsToBounds = true
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
        return MenuItem.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MenuCellID", forIndexPath: indexPath)
        cell.textLabel?.text = MenuItem[indexPath.row]
        // Configure the cell...
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        print("Logout")
        if(indexPath.row == 2)
        {
            self.performSegueWithIdentifier("LogoutBasic", sender: self)
        }
        if(indexPath.row == 0)
        {
            self.performSegueWithIdentifier("BasicUserProfileSegue", sender: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
