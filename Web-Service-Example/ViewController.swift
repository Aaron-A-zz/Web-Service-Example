//
//  ViewController.swift
//  Web-Service-Example
//
//  Created by Aaron Ackerman on 4/18/15.
//  Copyright (c) 2015 Aaron Ackerman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myNameLabel: UILabel!
    @IBOutlet weak var myWebsiteLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myNameLabel.text = ""
        
        //ActivityIndicatorView
        var activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.center = view.center
        activityIndicatorView.startAnimating()
        
        
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET( "http:/graph.facebook.com/bobdylan",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                
                println("Response: " + responseObject.description)
                if let myName = responseObject["name"] as? String {
                    self.myNameLabel.text = myName
                }
                if let myWebsite = responseObject["website"] as? String {
                    self.myWebsiteLabel.text = myWebsite
                }
                activityIndicatorView.removeFromSuperview()
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

