//
//  MyCollectionViewCell.swift
//  Partyguard_iOS
//
//  Created by Tankasala,Nandeesh on 11/16/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell
{
    ///This variable holds the guardname
    @IBOutlet weak var guardname:UILabel!
    ///This variable holds the guardimage
    @IBOutlet weak var guardimage:UIImageView!
    /**
     This function is triggered when the user clicks the view button in the collection view cell 
     :param: sender anyObject
     */
    @IBAction func profilebutton(sender:AnyObject)
    {
        
    }
}
