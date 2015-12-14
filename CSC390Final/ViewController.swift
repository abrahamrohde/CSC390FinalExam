//
//  ViewController.swift
//  CSC390Final
//
//  Created by Abraham Rohde on 12/14/15.
//  Copyright © 2015 Abraham Rohde. All rights reserved.
//

import UIKit
import WatchConnectivity
import Parse


class ViewController: UIViewController, WCSessionDelegate
{

    var session : WCSession!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if WCSession.isSupported()
        {
            self.session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        
        
        let query = PFQuery(className:"attempts")
        query.whereKey("owner_id", equalTo: PhoneCore.currentUser)
        query.findObjectsInBackgroundWithBlock { (objects : [PFObject]?, error: NSError?) -> Void in
            if(objects != nil)
            {
                
                
                //PhoneCore.theRowData = objects!
                //self.theTableView.reloadData()
            }
            else
            {
                print("None Found")
            }
        }
        
    }

    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject])
    {
        print("in DidReceiveMessageg")
        let theMessage = message["attempts"]!
        
        let attempt = PFObject(className:"attempts")
        attempt["owner_id"] = PhoneCore.currentUser
        attempt.saveInBackgroundWithBlock
            {
                (success: Bool, error: NSError?) -> Void in
                if (success)
                {
                    // The object has been saved.
                } else {
                    // There was a problem, check error.description
                }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

