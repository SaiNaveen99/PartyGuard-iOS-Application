//
//  ViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicLoginViewController: UIViewController {

    
    
    @IBOutlet weak var EmailTF: UITextField!
    
    
    @IBOutlet weak var PasswordTF: UITextField!
   

    
    @IBAction func LoginButton(sender: AnyObject)
    {
        
        if(EmailTF.text == "" || PasswordTF.text == "")
        {
            let alert = UIAlertView()
            alert.title = "Invalid Login"
            alert.message = "Please enter valid details"
            alert.addButtonWithTitle("Ok!")
            alert.show()
            
        }
        else
        {
         
           
            let ivc:InfoViewController = InfoViewController()
            
            presentViewController(ivc, animated: true, completion: nil)
            
        let textdata = "username="+EmailTF.text!+"&password="+PasswordTF.text!+"&grant_type=password"
        
        do {
           
            
            let url = NSURL(string: "http://partyguardservices20160912122440.azurewebsites.net/token")!
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
                    alert1.message = "Username or password does not exists"
                    alert1.addButtonWithTitle("Ok!")
                    alert1.show()
                    return
                }
                else
                {
                do {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]
                    
                    print("Result -> \(result)")
                     self.performSegueWithIdentifier("LoginSegue", sender: self)
                    
                } catch {
                    print("Error -> \(error)")
                }
                }
            }
            
            task.resume()
                
           
        }
        }
        
    }    
    
    
    @IBAction func HostLoginButton(sender: AnyObject) {
        self.performSegueWithIdentifier("segue2", sender: self)
    }
   
   
    @IBAction func GuardLoginButton(sender: AnyObject) {
        self.performSegueWithIdentifier("segue3", sender: self)
    }
   
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

