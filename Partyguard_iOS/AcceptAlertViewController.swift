//
//  AcceptAlertViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/27/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class AcceptAlertViewController: UIViewController {
    
    ///This variable holds the Comment, user entered in the textfield
    var commentsTextField: UITextField?
     ///This variable holds the instance of the AppDelegate
     let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
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
        
        let alert = UIAlertController(title: "Are you sure?\n ______________________________", message: " ", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            self.commentsTextField = textField
        })
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Left
        
        let messageText = NSMutableAttributedString(
            string: "Alert Type:\n "+appDelegate.issueSelected+"\nLocation\n "+appDelegate.incidentSelected+"\nComments",
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
    /**
     This function defines the action to be performed when user clicks accept
     
     */
    func acceptHandler()
    {
        print("Acept Handler Function")
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
            let parameters = ["issueName":appDelegate.issueSelected,"issueLocation":appDelegate.incidentSelected,"issueDate": "\(NSDate())","comments":(commentsTextField?.text)!,"fraternityName":appDelegate.fraternitySelected] as Dictionary<String, String>
            
            do {
                
                let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
                
                let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/api/IssuesModels")
                
                let request = NSMutableURLRequest(URL: url!)
                request.HTTPMethod = "POST"
                request.setValue("Bearer \(appDelegate.accessToken)", forHTTPHeaderField: "Authorization")
                
                
                request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
                request.HTTPBody = jsonData
                print("Sending request")
                
                let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                    if error != nil{
                        print("Error -> \(error)")
                        return
                    }
                    else
                    {
                        print("Came into else loop")
                        
                        print("Response to Issue Submission \(response)")
                    }
                    
                    
                }
                
                task.resume()
                //return task
                
            } catch {
                print(error)
            }
        
        
    }
    /**
     This function defines the action to be performed when user clicks decline
     
     */
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
