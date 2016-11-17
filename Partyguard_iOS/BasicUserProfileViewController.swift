//
//  BasicUserProfileViewController.swift
//  Partyguard_iOS
//
//  Created by BashGuardians on 10/21/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicUserProfileViewController: UIViewController {
    
    
    @IBOutlet weak var FirstNameTF: UITextField!
    
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    @IBOutlet weak var UniversityTF: UITextField!
    
    
    @IBOutlet weak var EmailIdTF: UITextField!
    
    

    @IBOutlet weak var phoneNumberTF: UITextField!
    
    
    @IBOutlet weak var Editbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstNameTF.borderStyle = .None
        lastNameTF.borderStyle = .None
        UniversityTF.borderStyle = .None
        EmailIdTF.borderStyle = .None
        phoneNumberTF.borderStyle = .None
        Editbutton.titleLabel?.text = "Edit"

       
    }

    @IBAction func editBTN(sender: AnyObject) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
