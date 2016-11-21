//
//  ViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicLoginViewController: UIViewController {

    
    ///This variable holds the Email user entered in the textfield
    @IBOutlet weak var EmailTF: UITextField!
    
    ///This variable holds the Password user entered in the textfield
    @IBOutlet weak var PasswordTF: UITextField!
   

    /**
     This function is triggered when the user clicks the login button
     :param: sender anyObject
     */
    @IBAction func LoginButton(sender: AnyObject)
    {
  
        if(self.EmailTF.text == "" || self.PasswordTF.text == "")
        {
            let alert = UIAlertView()
            alert.title = "Invalid Login"
            alert.message = "Please enter valid details"
            alert.addButtonWithTitle("Okay!")
            alert.show()
          self.performSegueWithIdentifier("HostLoginSegue", sender: self)
        }
        else
        {
            
            
        let textdata = "username="+self.EmailTF.text!+"&password="+self.PasswordTF.text!+"&grant_type=password"
        
        do {
           
            
            let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/token")!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            
            // insert json data to the request
            request.setValue("text/plain; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = textdata.dataUsingEncoding(NSUTF8StringEncoding)
            
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    let alert1 = UIAlertView()
                    alert1.title = "Invalid Login"
                    alert1.message = "Username or password is incorrect"
                    alert1.addButtonWithTitle("Ok!")
                    alert1.show()
                    return
                }
                else
                {
                do {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String:AnyObject]
                    
                    print("Result -> \(result)")
                    if(result?.indexForKey("error") == nil)
                    {
                        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        appDelegate.accessToken = result!["access_token"] as! String
                        
                       
                        
                        let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/api/Account/UserInfo")!
                        let request = NSMutableURLRequest(URL: url)
                        
                        request.HTTPMethod = "GET"
                        request.setValue("Bearer \(appDelegate.accessToken)", forHTTPHeaderField: "Authorization")
                        
                        
                        let task1 = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
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
                                    let resultforUserInfo = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [String:AnyObject]
                                if(resultforUserInfo!["UserType"] as! String == "basic")
                                {
                                    NSOperationQueue.mainQueue().addOperationWithBlock {
                                        self.performSegueWithIdentifier("LoginSegue", sender: self)
                                    }
                                    }
                                    else if(resultforUserInfo!["UserType"] as! String == "guard")
                                {
                                    NSOperationQueue.mainQueue().addOperationWithBlock {
                                        self.performSegueWithIdentifier("GuardLoginSegue", sender: self)
                                    }
                                    }
                                else{
                                    NSOperationQueue.mainQueue().addOperationWithBlock {
                                        self.performSegueWithIdentifier("HostLoginSegue", sender: self)
                                    }
                                    }
                                    
                                    
                                    
                                    
                                    
                                    print("Result of Profile View-> \(resultforUserInfo)")
                                }
                                catch {
                                    print("Error -> \(error)")
                                }
                                
                                
                                
                                
                            }
                        }
                        task1.resume()
                        
                        print("Login Succesful")
                   
                   
                    }

                    
                    
                } catch {
                    print("Error -> \(error)")
                }
                }
            }
            
            task.resume()
            
           
        }
 
        }

        
    
    }
    
    /**
     This function is triggered when the user clicks the Hostlogin button
     :param: sender anyObject
     */
    @IBAction func HostLoginButton(sender: AnyObject) {
        self.performSegueWithIdentifier("segue2", sender: self)
    }
   
    /**
     This function is triggered when the user clicks the Guard login button
     :param: sender anyObject
     */
    @IBAction func GuardLoginButton(sender: AnyObject) {
        self.performSegueWithIdentifier("segue3", sender: self)
    }
    /**
     This function is triggered when the user clicks the CreateAccount button
     :param: sender anyObject
     */
    @IBAction func RegisterButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("segue1", sender: self)
    }
    override func viewDidLoad()
    {
        self.view.backgroundColor = UIColor.lightTextColor()
//        validationLBL.hidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

