//
//  AcceptAlertViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/27/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class AcceptAlertViewController: UIViewController {
    
    var issueName: String = "Feeling Uncomfortable"
    var issueLocation: String = "Basement"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let alert = UIAlertController(title: "Are you sure?\n ______________________________", message: " ", preferredStyle: UIAlertControllerStyle.Alert)
        var inputTextField: UITextField?
        
        
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            inputTextField = textField
        })
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Left
        
        let messageText = NSMutableAttributedString(
            string: "Alert Type:\n "+issueName+"\nLocation\n "+issueLocation+"\nComments",
            attributes: [
                NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName : UIFont.preferredFontForTextStyle(UIFontTextStyleBody),
                NSForegroundColorAttributeName : UIColor.blackColor()
            ]
        )
        
        alert.setValue(messageText, forKey: "attributedMessage")
        
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { action in self.declineHandler() }))
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default, handler: { action in self.acceptHandler() }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func acceptHandler()
    {
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
            var parameters = ["issueName":"Fight","issueLocation":"Basement","issueDate":"May 2016","comments":"Need Help","fraternityName":"sigmaphi"] as Dictionary<String, String>
            
            do {
                
                let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
                
                let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/api/IssuesModels")
                
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
                        print("Success")
                        print(response)
                       
                        
                    }
                    
                    
                }
                
                task.resume()
                //return task
                
            } catch {
                print(error)
            }
        
        
    }
    
    func declineHandler()
    {
        let ivc = IncidentLocationTableViewController()
        self.presentViewController(ivc, animated: true, completion: nil)
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
