//
//  DetailViewController.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 10/28/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var tweet: Tweet!
    
    class func identifier() -> String {
        return "DetailViewController"
    }
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userNameTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppereance()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAppereance() {
        if self.tweet.isRetweet {
            if let rqUser = self.tweet?.rqUser {
                self.navigationItem.title = rqUser.name
            } else {
                self.navigationItem.title = self.tweet.user?.name
            }
        }
        if let user = self.tweet.user {
            self.navigationItem.title = user.name
        }
    }
    
    func setupTweetDetailViewController() {
        self.tweetTextLabel.text = self.tweet.isRetweet ? self.tweet.rqText : self.tweet.text
    }
}
