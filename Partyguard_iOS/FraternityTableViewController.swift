//
//  FraternityTableViewController.swift
//  Partyguard_iOS
//
//  Created by Somu,Vinod Reddy on 9/7/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit


class FraternityTableViewController: UITableViewController {


    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    var Fraternities = ["SigEp","TKE","PhiDelta","PhiSig"]
    var subtitles = ["Sigma Phi Epsilon","Tau Kappa Epsilon","Phi Delta Theta","Phi Sigma Kappa"]
    var Icons = ["SPE.gif","TKE.gif","PDT.gif","PSK1.png"]
    
    
    
    
    override func viewDidLoad() {
                super.viewDidLoad()
                menuBarButton.target = self.revealViewController()
                menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        // Do any additional setup after loading the view.
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
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
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
    
    
    
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertView()
        alert.title = "Nothing Done Yet!"
        alert.message = "Click Exit"
        alert.addButtonWithTitle("Exit")
        alert.show()
    }
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    
}
