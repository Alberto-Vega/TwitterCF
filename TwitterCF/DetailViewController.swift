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
    @IBOutlet weak var userImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppereance()
        setupTweetDetailViewController()
        setUpButtonImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupAppereance() {
        if self.tweet.isRetweet {
            if let rqUser = self.tweet?.rqUser?.name {
                self.navigationItem.title = rqUser
                //                self.userImageButton.backgroundImageForState(.Normal) = rqUser
                return
            } else {
                self.navigationItem.title = self.tweet?.user?.name
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
    
    func setUpButtonImage() {
        if let tweet = self.tweet, user = tweet.user {
            
            if let image = user.image, backgroundImage = user.backgroundImage {
                self.tweet.user?.image = image
                self.userImageButton.setBackgroundImage(image, forState: .Normal)
                self.tweet.user?.backgroundImage = backgroundImage
                
                
            } else {
                if let url = NSURL(string: user.profileImageURL), backgroundURL = NSURL(string: user.backgroundProfileImage!) {
                    
                    let downloadQ = dispatch_queue_create("downloadQ", nil)
                    dispatch_async(downloadQ, { () -> Void in
                        let imageData = NSData(contentsOfURL: url)!
                        let backgroundImageData = NSData(contentsOfURL: backgroundURL)!
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            let image = UIImage(data: imageData)
                            let backgroundImage = UIImage(data: backgroundImageData)
                            self.tweet.user?.image = image
                            self.tweet.user?.backgroundImage = backgroundImage
                            self.userImageButton.setBackgroundImage(image, forState: .Normal)
                        })
                    })
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UserTimelineTableView" {
            
            let TimelineVC = segue.destinationViewController as! UserTimelineViewController
            TimelineVC.selectedTweet = tweet
        }
    }
}

