//
//  BasicRegisterViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicRegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var FirstNameTF: UITextField!
    
    
    @IBOutlet weak var LastNameTF: UITextField!
    
    
    @IBOutlet weak var ProfileIV: UIImageView!
    
    @IBOutlet weak var EmailTF: UITextField!
    
    
    
    
    @IBOutlet weak var PasswordTF: UITextField!
    
    
    @IBOutlet weak var RepeatPasswordTF: UITextField!
    
    
    
    @IBOutlet weak var PhoneNumberTF: UITextField!
    
    
    @IBOutlet weak var DobTF: UITextField!
    
    
    @IBOutlet weak var PinTF: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    
    @IBAction func CreateAccountButton(sender: AnyObject) {
        if(EmailTF.text == "" || PasswordTF == "" || RepeatPasswordTF == "" || PhoneNumberTF == "" || DobTF == "")
        {
            let alert = UIAlertView()
            alert.title = "All Fields are required"
            alert.message = "Password must contain and one letter, symbol and a number with atleast six characters long"
            alert.addButtonWithTitle("Ok!")
            alert.show()
            
        }
        else
        {
            //self.performSegueWithIdentifier("createAccountSegue", sender: self)
        var parameters = ["Email": EmailTF.text!, "Password": PasswordTF.text!, "ConfirmPassword" : RepeatPasswordTF.text!, "firstName": FirstNameTF.text!, "lastName": LastNameTF.text!, "phoneNumber": PhoneNumberTF.text!, "userType": "basic"] as Dictionary<String, String>
        
      do {
            
            let jsonData = try NSJSONSerialization.dataWithJSONObject(parameters, options: .PrettyPrinted)
            
            let url = NSURL(string: "http://partyguardservices20161023022749.azurewebsites.net/api/Account/Register")
            
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
                    //self.performSegueWithIdentifier("createAccountSegue", sender: self)
                    print("Success")
                    NSOperationQueue.mainQueue().addOperationWithBlock {
                        self.performSegueWithIdentifier("createAccountSegue", sender: self)
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

override func viewDidLoad()
    {
        
       
        imagePicker.delegate = self
        self.view.backgroundColor = UIColor.lightTextColor()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func uploadImageButtonAction(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
