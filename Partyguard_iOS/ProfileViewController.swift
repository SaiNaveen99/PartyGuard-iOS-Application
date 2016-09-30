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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
