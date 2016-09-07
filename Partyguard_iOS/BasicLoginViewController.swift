//
//  ViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicLoginViewController: UIViewController {

    @IBOutlet weak var TitleLBL: UILabel!
    
    
    @IBOutlet weak var EmailTF: UITextField!
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBAction func LoginButton(sender: AnyObject)
    {
        
    }
    
    
    @IBAction func HostLoginButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("segue2", sender: self)
    }
   
    @IBAction func RegisterButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("segue1", sender: self)
    }
    override func viewDidLoad()
    {
        TitleLBL.text = "PartyGuard"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

