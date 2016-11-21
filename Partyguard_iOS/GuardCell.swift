//
//  GuardCell.swift
//  PGTeam
//
//  Created by BashGuardians on 11/5/16.
//  Copyright © 2016 Northwest. All rights reserved.
//

import UIKit

class GuardCell: UICollectionViewCell {
    
    
    
    
    //This variable holds the flag that tells whether the guard is active or not
    @IBOutlet weak var onlineSymbol: UILabel!
    ///This variable holds the guardimage
    @IBOutlet weak var guardImage: UIImageView!
    
    /**
     This function is triggered when the user clicks the view button in the collection view cell
    
     */
    @IBOutlet weak var guardViewButton: UIButton!
    
    ///This variable holds the guardname
    @IBOutlet weak var guardNameLabel: UILabel!
    }
