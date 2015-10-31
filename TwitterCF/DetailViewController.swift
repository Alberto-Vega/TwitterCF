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
        setupTweetDetailViewController()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAppereance() {
        if self.tweet.isRetweet {
            if let rqUser = self.tweet.rqUser?.name {
                self.navigationItem.title = rqUser
                return
            } else {
                self.navigationItem.title = self.tweet.user?.name
                return
            }
        }
        if let user = self.tweet.user?.name {
            self.navigationItem.title = user
        }
    }
    
    func setupTweetDetailViewController() {
        self.tweetTextLabel.text = self.tweet.isRetweet ? self.tweet.rqText : self.tweet.text
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UserTimelineTableView" {
            
            
        let TimelineVC = segue.destinationViewController as! UserTimelineViewController
            
               TimelineVC.selectedTweet = tweet
            

            
        }
    }
}

