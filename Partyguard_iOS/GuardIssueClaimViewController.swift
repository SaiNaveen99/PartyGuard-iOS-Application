//
//  GuardIssueClaimViewController.swift
//  Partyguard_iOS
//
//  Created by Sai Naveen Mallampati on 11/17/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class GuardIssueClaimViewController: UIViewController {
    
    
    @IBOutlet weak var nameLBL: UILabel!
    
    
    @IBOutlet weak var fraternityLBL: UILabel!
    
    
    @IBOutlet weak var alertypeLBL: UILabel!
    
    
    @IBOutlet weak var locationLBL: UILabel!
    
    

    @IBOutlet weak var CommentsLBL: UILabel!
    
    var basicUserName:String!
    
    
    @IBOutlet weak var claimBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        print("basic username \(basicUserName)")
        nameLBL.text = basicUserName
    }
    
    @IBAction func claimaction(sender: AnyObject) {
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
