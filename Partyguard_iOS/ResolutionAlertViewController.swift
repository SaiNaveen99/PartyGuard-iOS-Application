//
//  ResolutionAlertViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/27/16.
//  Copyright 2016 BashGuardians. All rights reserved.
//

import UIKit

class ResolutionAlertViewController: UIViewController {
    
    
    var guardUserResolved: String = "James Brown"

     ///Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()

        // Do any additional setup after loading the view.
        print("resolution")
        
    }
///Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     This function is triggered everytime view appears
     :param: animated  Is a boolean type
     */
    override func viewWillAppear(animated: Bool) {
        let titleText:String = guardUserResolved + " sent a resolution"// text String
        let resolutionAlert = UIAlertController(title:titleText, message: " ", preferredStyle: UIAlertControllerStyle.Alert)
        
        resolutionAlert.addAction(UIAlertAction(title: "Decline", style: UIAlertActionStyle.Default, handler: { action in self.declineHandler() }))
        
        resolutionAlert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default, handler: { action in self.acceptHandler() }))
        
        
        self.presentViewController(resolutionAlert, animated: true, completion: nil)// present view controller

        
    }

    
    
    /**
     This function is triggered when user clicks on Resolve button
     :param: sender
     */
    @IBAction func buttonAction(sender: AnyObject) {
        self.performSegueWithIdentifier("ResolutionSegue", sender: self)
        
    }
    /**
     This function defines the action to be performed when user clicks accept
     
     */
    func acceptHandler()
    {
       self.viewDidLoad()
    }
    /**
     This function defines the action to be performed when user clicks decline
     
     */
    func declineHandler()
    {
        let fvc = FraternityTableViewController()  // var fvc
        presentViewController(fvc, animated: true, completion: nil)// above declared present view controller
        
    }
}
