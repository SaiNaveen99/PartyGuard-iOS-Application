//
//  GuardRegisterViewController.swift
//  Partyguard_iOS
//
//  Created by Sai Naveen Mallampati on 11/17/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class GuardRegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var guardfirstNameTF: UITextField!
    
    
    @IBOutlet weak var ProfileIV: UIImageView!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    
    @IBOutlet weak var EmailTF: UITextField!
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBOutlet weak var uploadImageBTN: UIButton!
    
    @IBOutlet weak var RepeatPasswordTF: UITextField!
    
    
    @IBOutlet weak var phoneNumberTF: UITextField!
    
    
    @IBOutlet weak var guardUserCode: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        imagePicker.delegate = self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ProfileIV.contentMode = .ScaleAspectFit
            ProfileIV.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func uploadImageAction(sender: AnyObject) {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    
    @IBAction func createAccountAction(sender: AnyObject) {
     
        if(EmailTF.text == "" || PasswordTF == "" || RepeatPasswordTF == "" || phoneNumberTF == "")
        {
            let alert = UIAlertView()
            alert.title = "All Fields are required"
            alert.message = "Password must contain and one letter, symbol and a number with atleast six characters long"
            alert.addButtonWithTitle("Ok!")
            alert.show()
            
        }
        else
        {
            
            var parameters = ["firstName" : self.guardfirstNameTF.text!, "lastName":self.lastNameTF.text!, "guardUserCode":self.guardUserCode.text!,"Email":self.EmailTF.text!,"PhoneNumber":self.phoneNumberTF.text!,"Password":self.PasswordTF.text!, "userType":"guard"] as Dictionary<String, String>
            
            do {
                
                
                let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
                
                let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/api/Account/Register")
                
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
                        print(response)
                        NSOperationQueue.mainQueue().addOperationWithBlock {self.performSegueWithIdentifier("GuardRegistertoHome", sender: self)
                        }
                    }
                    
                    
                }
                
                task.resume()
                //return task
                
            } catch {
                print(error)
            }
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
