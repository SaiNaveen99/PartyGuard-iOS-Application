//
//  LocationChangeViewController.swift
//  Partyguard_iOS
//
//  Created by Koneru,Naga Venkata Sanjeev on 11/15/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class LocationChangeViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        currentLocationLBL.text = "Location Change"
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var currentLocationLBL: UILabel!
//var textToShow : String?
//    override func viewWillAppear(animated: Bool) {
//        if let textToShow = textToShow {
//            currentLocationLBL.text = textToShow
//        }
//    }
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        //if such cell exists and destination controller (the one to show) exists too..
//        if let subjectCell = tableView.cellForRowAtIndexPath(indexPath), let destinationViewController = navigationController?.storyboard?.instantiateViewControllerWithIdentifier("MenuCellID") as? LocationChangeViewController{
//            //This is a bonus, I will be showing at destionation controller the same text of the cell from where it comes...
//            if let text = subjectCell.textLabel?.text {
//                destinationViewController.textToShow = text
//            } else {
//                destinationViewController.textToShow = "Tapped Cell's textLabel is empty"
//            }
//            //Then just push the controller into the view hierarchy
//            navigationController?.pushViewController(destinationViewController, animated: true)
//        }
//    }
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
