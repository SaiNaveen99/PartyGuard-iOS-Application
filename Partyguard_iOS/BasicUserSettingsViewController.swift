//
//  BasicUserSettingsViewController.swift
//  Partyguard_iOS
//
//  Created by Sai Naveen Mallampati on 11/15/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicUserSettingsViewController: UIViewController {
    
    
    ///It holds the old password user entered in textfield
    @IBOutlet weak var Oldpwd: UITextField!
    
    ///It holds the new password user entered in textfield
    @IBOutlet weak var Newpwd: UITextField!
    ///It holds the password user entered in textfield
    @IBOutlet weak var Repeatpwd: UITextField!
    
    
    /**
     This function is triggered when user clicks on Edit button
     
     :param:  sender
     
     */
    @IBAction func Editclicked(sender: AnyObject)
    {
        
    }
    
    ///Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   ///Sent to the view controller when the app receives a memory warning
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
