//
//  MenuViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/14/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    var MenuItem = ["Profile","Location Change","Log","Settings","About PartyGuard"]

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.clipsToBounds = true
        
        

        // Do any additional setup after loading the view.
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
