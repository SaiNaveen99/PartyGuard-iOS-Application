//
//  InfoViewController.swift
//  Partyguard_iOS
//
//  Created by Somu,Vinod Reddy on 9/7/16.
//  Copyright 2016 BashGuardians. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

 
 ///Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        
        super.viewDidLoad()  // calling method from parent class.

        // Do any additional setup after loading the view.
    }
///Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()// Dispose 
        // Dispose of any resources that can be recreated.
    }
    
    /**
     This function is triggered when the user clicks the Next Button
     :param: sender Is an UIBarButtonItem
     */
    @IBAction func onclickNextButton(sender: UIBarButtonItem) {
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
