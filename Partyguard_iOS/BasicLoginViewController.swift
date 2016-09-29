//
//  ViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicLoginViewController: UIViewController {

    @IBOutlet weak var TitleLBL: UILabel!
    
    
    @IBOutlet weak var EmailTF: UITextField!
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBOutlet weak var validationLBL: UILabel!
    
    
    
    @IBAction func LoginButton(sender: AnyObject)
    {
        
        if(EmailTF.text == "" || PasswordTF.text == "")
        {
            
            validationLBL.hidden = false
            validationLBL.text = " Username and Password fields should not be Empty"
            
        }
        else
        {
         
            self.performSegueWithIdentifier("LoginSegue", sender: self)
            let ivc:InfoViewController = InfoViewController()
            
            presentViewController(ivc, animated: true, completion: nil)
            
        let textdata = "username="+EmailTF.text!+"&password="+PasswordTF.text!+"grant_type=password"
        
        do {
           
            
            let url = NSURL(string: "http://partyguardservices20160912122440.azurewebsites.net/token")!
            let request = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            
            // insert json data to the request
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.HTTPBody = textdata.dataUsingEncoding(NSUTF8StringEncoding)
            
            
            let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
                if error != nil{
                    print("Error -> \(error)")
                    return
                }
                
                do {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? [String:AnyObject]
                    
                    print("Result -> \(result)")
                    
                } catch {
                    print("Error -> \(error)")
                }
            }
            
            task.resume()
           
        }
        }
        
    }
    
    
    @IBAction func HostLoginButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("segue2", sender: self)
    }
   
    @IBAction func RegisterButton(sender: AnyObject)
    {
        self.performSegueWithIdentifier("segue1", sender: self)
    }
    override func viewDidLoad()
    {
        TitleLBL.text = "PartyGuard"
        self.view.backgroundColor = UIColor.lightTextColor()
        validationLBL.hidden = true
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

