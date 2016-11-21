//
//  GuardLoginViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 10/16/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class GuardLoginViewController: UIViewController {

    ///This variable holds the Email user entered in the textfield
    @IBOutlet weak var EmailTF: UITextField!
    ///This variable holds the password user entered in the textfield
    @IBOutlet weak var passwordTF: UITextField!
     ///Called after the controller's view is loaded into memory.
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
///Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     This function is triggered when the user clicks the Guardlogin button
     :param: sender anyObject
     */
    @IBAction func GuardLogin(sender: AnyObject) {
        self.performSegueWithIdentifier("GuardLoginSegue", sender: self)
    }
    /**
     This function is triggered when the user clicks the ForgotPassword button
     :param: sender anyObject
     */
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
