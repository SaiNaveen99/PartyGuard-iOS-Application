//
//  GuardLoginViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class HostLoginViewController: UIViewController {
    
    
    
     ///This variable holds the Email user entered in the textfield
    @IBOutlet weak var EmailTF: UITextField!
    
     ///This variable holds the password user entered in the textfield
    @IBOutlet weak var PasswordTF: UITextField!
   

    override func viewDidLoad()
    {
        self.view.backgroundColor = UIColor.lightTextColor()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     This function is triggered when the user clicks the Hostlogin button
     :param: sender anyObject
     */
    @IBAction func loginAction(sender: AnyObject) {
        
        
    }
 

}
