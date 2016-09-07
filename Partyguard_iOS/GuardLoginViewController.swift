//
//  GuardLoginViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class GuardLoginViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var TitleLBL: UILabel!
    
    
    @IBOutlet weak var EmailTF: UITextField!
    
    
    @IBOutlet weak var PasswordTF: UITextField!

    override func viewDidLoad()
    {
        TitleLBL.text = "PartyGuard"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
