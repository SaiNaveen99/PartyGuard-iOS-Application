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
    var issueId:Int!
    
    
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
