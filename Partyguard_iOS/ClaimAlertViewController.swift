//
//  ClaimAlertViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/27/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class ClaimAlertViewController: UIViewController {
    
    var guardUserClaimed: String = "James Brown"

     ///Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        
        // Do any additional setup after loading the view.
    }
    /**
     This function is triggered everytime view appears
     :param: animated  Is a boolean type
     */
    override func viewWillAppear(animated: Bool) {
        let titleText:String = guardUserClaimed + " has claimed your request for assistance"
         let claimAlert = UIAlertController(title:titleText, message: " ", preferredStyle: UIAlertControllerStyle.Alert)//
        
        claimAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in self.claimHandler() }))
        
         self.presentViewController(claimAlert, animated: true, completion: nil)
        
       
    }
    /**
     This function defines the action to be performed when user clicks claim
     
     */
    func claimHandler()
    {
        self.performSegueWithIdentifier("resolutionSegue", sender: self)
      // let rvc = ResolutionAlertViewController()
      //  self.presentViewController(rvc, animated: true, completion: nil)
     
        
    }
    ///Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
