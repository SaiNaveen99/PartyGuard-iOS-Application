//
//  ProfileViewController.swift
//  Partyguard_iOS
//
//  Created by Somu,Vinod Reddy on 9/19/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var LBL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        LBL.text = "Profile"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func logoutAction(sender: AnyObject) {
        
        self.performSegueWithIdentifier("LogoutGuard", sender: self)
    }

}
