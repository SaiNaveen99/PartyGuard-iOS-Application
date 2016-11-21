//
//  BasicRegisterViewController.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 9/6/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class BasicRegisterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    ///This variable holds the FirstName user entered in the textfield
    @IBOutlet weak var FirstNameTF: UITextField!
    
    ///This variable holds the LastName user entered in the textfield
    @IBOutlet weak var LastNameTF: UITextField!
    
    ///This variable holds the ProfileImage user selected from library
    @IBOutlet weak var ProfileIV: UIImageView!
    
    ///This variable holds the Email user entered in the textfield
    @IBOutlet weak var EmailTF: UITextField!
    

    ///This variable holds the Password user entered in the textfield
    @IBOutlet weak var PasswordTF: UITextField!
    
    ///This variable holds the Password user entered in the textfield
    @IBOutlet weak var RepeatPasswordTF: UITextField!
    
    
    ///This variable holds the PhoneNumber user entered in the textfield
    @IBOutlet weak var PhoneNumberTF: UITextField!
    
    ///This variable holds the Date of Birth user entered in the textfield
    @IBOutlet weak var DobTF: UITextField!
    
    ///This variable holds the ZipCode user entered in the textfield
    @IBOutlet weak var PinTF: UITextField!
    
    let imagePicker = UIImagePickerController()
    
    /**
     This function is triggered when the user clicks the CreateAccount button
     :param: sender anyObject
     */
    @IBAction func CreateAccountButton(sender: AnyObject) {
        
        print("Basic User Create Account")
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
         
            var parameters = ["Email": EmailTF.text!, "Password": PasswordTF.text!, "ConfirmPassword" : RepeatPasswordTF.text!, "firstName" : FirstNameTF.text!, "lastName" : LastNameTF.text!, "PhoneNumber" : PhoneNumberTF.text!, "userType" : "basic"] as Dictionary<String, String>
            
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
                            NSOperationQueue.mainQueue().addOperationWithBlock {self.performSegueWithIdentifier("BasicLoginAfterRegister2", sender: self)
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

     ///Called after the controller's view is loaded into memory.
override func viewDidLoad()
    {
        
       
        imagePicker.delegate = self
        self.view.backgroundColor = UIColor.lightTextColor()
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    /**
     This function is triggered when the user clicks the UploadImage button
     :param: sender anyObject
     */
    @IBAction func uploadImageButtonAction(sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
///Sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     This function is defines what happens when user clicks on upload image button
     :param: picker Is a UIImagePickerController object
     */
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            ProfileIV.contentMode = .ScaleAspectFit
            ProfileIV.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    /**
     This function is defines what has to be done when user clicks on cancel button
     :param: picker Is a UIImageController object 
     */
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
