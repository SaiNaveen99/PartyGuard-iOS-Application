//
//  PGTeamCollectionViewController.swift
//  PGTeam
//
//  Created by BashGuardians on 11/5/16.
//  Copyright © 2016 Northwest. All rights reserved.
//

import UIKit

private let reuseIdentifier = "pgcell"

class PGTeamCollectionViewController: UICollectionViewController {
    
    ///This variable holds the guard names comes from the web service
    var guardnames:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     This function is triggered every time page loads.
     :param: Animated  Boolean variable
 */
    override func viewWillAppear(animated: Bool) {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let url = NSURL(string: "http://partyguardservices20161110094537.azurewebsites.net/api/HostUserProfile/DisplayGuardDetails")!
        let request = NSMutableURLRequest(URL: url)
        
        request.HTTPMethod = "POST"
        request.setValue("Bearer \(appDelegate.accessToken)", forHTTPHeaderField: "Authorization")
        
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){ data, response, error in
            if error != nil{
                print("Error -> \(error)")
                let alert1 = UIAlertView()
                alert1.title = "Invalid Login"
                alert1.message = "Username or password does not exists"
                alert1.addButtonWithTitle("Ok!")
                alert1.show()
                return
            }
            else
            {
                do
                {
                    let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? [[String:AnyObject]]
                    for(var i=0; i<result?.count;i++)
                    {
                        self.guardnames.append("\(result![i]["firstName"] as! String) \(result![i]["lastName"] as! String)")
                    }
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        self.collectionView?.reloadData()
                    }
                    
                    print(response)
                    
                    
                    print("Result of PG Team View Controller \(result)")
                }
                catch {
                    print("Error -> \(error)")
                }
                
                
                
                
            }
        }
        task.resume()
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    /**
     This function defines number of sections in a collection view
     :param: collectionview
     :returns: Number of sections
     */

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    /**
     This function defines number of items in each esction
     :returns: Number of items
     */

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return guardnames.count
    }
    /**
     This function defines CollectionView cell for each row
     :returns: Collection view cell
     */

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        print("hello")
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! GuardCell
        
        let image = UIImage(named: "DC.png")
        //let imageView = UIImageView(image: image!)
        cell.guardImage = UIImageView(image: image!)
        cell.guardNameLabel.text = guardnames[indexPath.row]
        cell.guardViewButton.titleLabel?.text = "View"
        cell.onlineSymbol.text = "yes"
        cell.layer.borderColor = UIColor.blackColor().CGColor
        cell.layer.borderWidth = 1.0
        
        
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
     return false
     }
     
     override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
     
     }
     */
    
}
