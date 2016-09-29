//
//  BasicRegisterViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicRegisterViewController: UIViewController {

    @IBOutlet weak var FirstNameTF: UITextField!
    
    
    @IBOutlet weak var LastNameTF: UITextField!
    
    
    @IBOutlet weak var ProfileIV: UIImageView!
    
    @IBOutlet weak var EmailTF: UITextField!
    
    
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBOutlet weak var RepeatPasswordTF: UITextField!
    
    
    
    @IBOutlet weak var PhoneNumberTF: UITextField!
    
    
    @IBOutlet weak var DobTF: UITextField!
    
    
    @IBOutlet weak var PinTF: UITextField!
    
    
    @IBAction func CreateAccountButton(sender: AnyObject) {
        
        var parameters = ["Email": EmailTF.text!, "Password": PasswordTF.text!, "ConfirmPassword" : RepeatPasswordTF.text!] as Dictionary<String, String>
        
      do {
            
            let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
            
            let url = NSURL(string: "http://partyguardservices20160912122440.azurewebsites.net/api/Account/Register")
            
            let request = NSMutableURLRequest(URL: url!)
            request.HTTPMethod = "POST"
            
        
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
                }
                
//                do {
//                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableLeaves) as? [String:AnyObject]
//                    
//                    print("Result -> \(result)")
//                    
//                } catch {
//                    print("Error -> \(error)")
//                }
            }
            
            task.resume()
            //return task
        
            } catch {
            print(error)
        }
       
    }

override func viewDidLoad()
    {
        
        ProfileIV.image = UIImage(named: "Dummy_profile.jpg")
        self.view.backgroundColor = UIColor.lightTextColor()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
