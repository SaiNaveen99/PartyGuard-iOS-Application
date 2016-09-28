//
//  PGTeamViewController.swift
//  Partyguard_iOS
//
//  Created by Somu,Vinod Reddy on 9/19/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class PGTeamViewController: UIViewController {

   
    @IBOutlet weak var Image1: UIImageView!
    
    
    @IBOutlet weak var Image2: UIImageView!
    
    
    @IBOutlet weak var Image3: UIImageView!
    
    
    @IBOutlet weak var Image4: UIImageView!
    
    
    @IBOutlet weak var Image5: UIImageView!
    
    
    @IBOutlet weak var Image6: UIImageView!
    
    
    @IBOutlet weak var Image7: UIImageView!
    
    
    
    @IBOutlet weak var Image8: UIImageView!
    
    
    
    @IBOutlet weak var Image9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image1.image = UIImage(named: "Gender Neutral User-50.png")
        Image2.image = UIImage(named: "Gender Neutral User-50.png")
        Image3.image = UIImage(named: "Gender Neutral User-50.png")
        Image1.layer.borderWidth = 0.5
        Image2.layer.borderWidth = 0.5
        Image3.layer.borderWidth = 0.5
        Image4.layer.borderWidth = 0.5
        Image5.layer.borderWidth = 0.5
        Image6.layer.borderWidth = 0.5
        Image7.layer.borderWidth = 0.5
        Image8.layer.borderWidth = 0.5
        Image9.layer.borderWidth = 0.5
        Image1.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image2.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image3.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image4.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image5.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image6.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image7.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image8.layer.borderColor = UIColor.lightGrayColor().CGColor
        Image9.layer.borderColor = UIColor.lightGrayColor().CGColor
        
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
