//
//  BasicRegisterViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicRegisterViewController: UIViewController {

    @IBOutlet weak var FirstNameTF: UITextField!
    
    
    @IBOutlet weak var LastNameTF: UITextField!
    
    
    @IBOutlet weak var ProfileIV: UIImageView!
    
    @IBOutlet weak var EmailTF: UITextField!
    
    
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBOutlet weak var RepeatPasswordTF: UITextField!
    
    
    
    @IBOutlet weak var PhoneNumberTF: UITextField!
    
    
    @IBOutlet weak var DobTF: UITextField!
    
    
    @IBOutlet weak var PinTF: UITextField!
    
    
    @IBAction func CreateAccountButton(sender: AnyObject) {
    }
    
    override func viewDidLoad()
    {
        
        ProfileIV.image = UIImage(named: "Dummy_profile.jpg")
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
