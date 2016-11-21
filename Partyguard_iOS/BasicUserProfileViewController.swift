//
//  BasicUserProfileViewController.swift
//  Partyguard_iOS
//
//  Created by BashGuardians on 10/21/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicUserProfileViewController: UIViewController {
    
    
    ///This variable holds the FirstName of the user that comes from the web service
    @IBOutlet weak var FirstNameTF: UITextField!
    
    
    ///This variable holds the LastName user of the that comes from the web service
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    ///This variable holds the UniversityName of the user that comes from the web service
    @IBOutlet weak var UniversityTF: UITextField!
    
    
    ///This variable holds the Email of the user that comes from the web service
    @IBOutlet weak var EmailIdTF: UITextField!
    
    
    
   ///This variable holds the PhoneNumber of the user that comes from the web service
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    ///This is a UIButton item that holds instance of Edit button
    @IBOutlet weak var Editbutton: UIButton!
     ///Called after the controller's view is loaded into memory.
    override func viewDidLoad() {
        
        super.viewDidLoad()
            }
    /**
     This function is triggered when the user clicks the Edit button
     :param: sender anyObject
     */

    @IBAction func editBTN(sender: AnyObject) {
        
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
        
         let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/api/Account/UserInfo")!
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
                        
                        self.FirstNameTF.text = result!["FirstName"] as? String
                        self.lastNameTF.text = result!["LastName"] as? String
                        self.UniversityTF.text = result!["University"] as? String
                        self.phoneNumberTF.text = result!["PhoneNumber"] as? String
                        self.EmailIdTF.text = result!["Email"] as? String
                        
                        
                        
                        
                        
                        print("Result of Profile View-> \(result)")
                        }
                       catch {
                        print("Error -> \(error)")
                    }
                    
                    
                    
                    
                    }
        }
        task.resume()
    }
    
    
    /**
     This function is triggered when the user clicks the Edit button
     :param: sender anyObject
     */

    @IBAction func EditAction(sender: AnyObject) {
        if(Editbutton.titleLabel?.text == "Edit")
        {
        FirstNameTF.userInteractionEnabled = true
        FirstNameTF.borderStyle = .Line
        lastNameTF.userInteractionEnabled = true
        lastNameTF.borderStyle = .Line
        UniversityTF.userInteractionEnabled = true
        UniversityTF.borderStyle = .Line
        EmailIdTF.borderStyle = .Line
        EmailIdTF.userInteractionEnabled = true
        phoneNumberTF.userInteractionEnabled = true
        phoneNumberTF.borderStyle = .Line
       
        Editbutton.setTitle("Update", forState: .Normal)
        print(Editbutton.titleLabel?.text)
            
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
