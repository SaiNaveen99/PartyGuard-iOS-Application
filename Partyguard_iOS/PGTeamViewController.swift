//
//  PGTeamViewController.swift
//  Partyguard_iOS
//
//  Created by Somu,Vinod Reddy on 9/19/16.
//  Copyright © 2016 BashGuardians. All rights reserved.
//

import UIKit

class PGTeamViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    
    //var names = ["vinod","naveen","nandeesh"]


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! MyCollectionViewCell
        let bcolor : UIColor = UIColor( red: 0.2, green: 0.2, blue:0.2, alpha: 0.3 )
        cell.layer.borderColor = bcolor.CGColor
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 7

        cell.guardname.text = "nandeesh-vinod"
        cell.guardimage.image = UIImage(named: "User Female-25.png")
        //viewDidLoad()
        return cell
    }
    
    override func viewDidLoad() {
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
