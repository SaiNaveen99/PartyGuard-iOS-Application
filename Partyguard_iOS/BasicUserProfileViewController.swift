//
//  BasicUserProfileViewController.swift
//  Partyguard_iOS
//
//  Created by BashGuardians on 10/21/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicUserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    @IBAction func editBTN(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
         let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let url = NSURL(string: "http://partyguardservices20161025060016.azurewebsites.net/api/Account/UserInfo")!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "GET"
             request.setValue("Bearer \(appDelegate.accessToken)", forHTTPHeaderField: "Authorization")
        
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    let alert1 = UIAlertView()
                    alert1.title = "Invalid Login"
                    alert1.message = "Username or password does not exists"
                    alert1.addButtonWithTitle("Ok!")
                    alert1.show()
                    return
                }
                else
                {
                       do
                       {
                        let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String:AnyObject]
                        
                        print("Result of Profile View-> \(result)")
                        }
                       catch {
                        print("Error -> \(error)")
                    }
                    
                    
                    
                    
                    }
        }
        task.resume()
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
