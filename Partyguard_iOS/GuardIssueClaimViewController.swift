//
//  GuardIssueClaimViewController.swift
//  Partyguard_iOS
//
//  Created by Sai Naveen Mallampati on 11/17/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class GuardIssueClaimViewController: UIViewController {
    
    ///This variable holds the name of the issue
    @IBOutlet weak var nameLBL: UILabel!
    
    ///This variable holds fraternity from which the issue has came
    @IBOutlet weak var fraternityLBL: UILabel!
    
    ///This variable holds the type of issue
    @IBOutlet weak var alertypeLBL: UILabel!
    
    ///This holds the location where issue has happened
    @IBOutlet weak var locationLBL: UILabel!
    
    
    ///This variable holds the additional comments the user types.
    @IBOutlet weak var CommentsLBL: UILabel!
    
    ///This variable holds the name of the basic user
    var basicUserName:String!
    ///This variable holds the issue id
    var issueId:Int!
    
    ///This variable holds the instance of claim button
    @IBOutlet weak var claimBTN: UIButton!
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
     This function is triggered everytime view appears
     :param: animated  Is a boolean type
     */
    override func viewWillAppear(animated: Bool) {
        print("basic username \(basicUserName)")
        nameLBL.text = basicUserName
    }
    /**
     This function is triggered when user clicks on claim button
     :param: sender anyObject
     */
    @IBAction func claimaction(sender: AnyObject) {
        
        
        var parameters = ["id": issueId] as Dictionary<String, Int>
        
        do {
            print(issueId)
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

            let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
            
            let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/GuardAlertsClaim")
            
            let request = NSMutableURLRequest(URL: url!)
            request.HTTPMethod = "POST"
            request.setValue("Bearer \(appDelegate.accessToken)", forHTTPHeaderField: "Authorization")
            
            
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = jsonData
            
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    return
                }
                else
                {
                    do
                    {
                        let resultforUserInfo = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String:AnyObject]
                        print(resultforUserInfo)
                        
                    }
                    catch
                    {
                        print("error")
                    }
                    
                }
                
                
            }
            
            task.resume()
            //return task
            
        } catch {
            print(error)
        }
        
        
        
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
