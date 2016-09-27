//
//  AcceptAlertViewController.swift
//  Partyguard_iOS
//
//  Created by Mallampati,Sai Naveen on 9/27/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class AcceptAlertViewController: UIViewController {
    
    var alertType: String = "Feeling Uncomfortable"
    var location: String = "Basement"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let alert = UIAlertController(title: "Are you sure?\n ______________________________", message: " ", preferredStyle: UIAlertControllerStyle.Alert)
        var inputTextField: UITextField?
        
        
        alert.addTextFieldWithConfigurationHandler({(textField: UITextField!) in
            inputTextField = textField
        })
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.Left
        
        let messageText = NSMutableAttributedString(
            string: "Alert Type:\n "+alertType+"\nLocation\n "+location+"\nComments",
            attributes: [
                NSParagraphStyleAttributeName: paragraphStyle,
                NSFontAttributeName : UIFont.preferredFontForTextStyle(UIFontTextStyleBody),
                NSForegroundColorAttributeName : UIColor.blackColor()
            ]
        )
        
        alert.setValue(messageText, forKey: "attributedMessage")
        
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Accept", style: UIAlertActionStyle.Default, handler: { action in self.acceptHandler() }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    func acceptHandler()
    {
        let cvc = ClaimAlertViewController()
        self.presentViewController(cvc, animated: true, completion: nil)
    }
    
    func declineHandler()
    {
        
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
