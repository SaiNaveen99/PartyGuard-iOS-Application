//
//  GuardLoginViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 10/16/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class GuardLoginViewController: UIViewController {

    @IBOutlet weak var EmailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func GuardLogin(sender: AnyObject) {
        self.performSegueWithIdentifier("GuardLoginSegue", sender: self)
    }
    @IBAction func ForgetPasswordButtonClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("fpGuardSegue", sender: self);
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
