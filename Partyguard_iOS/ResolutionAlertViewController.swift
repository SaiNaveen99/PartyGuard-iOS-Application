//
//  ResolutionAlertViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/27/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class ResolutionAlertViewController: UIViewController {
    
    
    var guardUserResolved: String = "James Brown"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        
        let titleText:String = guardUserResolved + " sent a resolution"
        let resolutionAlert = UIAlertController(title:titleText, message: " ", preferredStyle: UIAlertControllerStyle.Alert)
        
        resolutionAlert.addAction(UIAlertAction(title: "Decline", style: UIAlertActionStyle.Default, handler: nil))
        
        resolutionAlert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default, handler: nil))
        
        
        self.presentViewController(resolutionAlert, animated: true, completion: nil)

        
    }

   
}
