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
//   var tweet: Tweet! {
//        didSet {
//            if let tweet = self.tweet, user = tweet.user, text = self.tweet?.text {
////                self.tweetTextLabel.text = text
////                self.userNameTextLabel.text = "Tweeted by: \(user.name)"
//                if let image = user.image {
//                    if let backgroundImage = self.userImageButton {
//                    self.userImageButton.setBackgroundImage(image, forState: .Normal)
//                    }
//                } else {
//                    if let url = NSURL(string: user.profileImageURL) {
//                        let downloadQ = dispatch_queue_create("downloadQ", nil)
//                        dispatch_async(downloadQ, { () -> Void in
//                            let imageData = NSData(contentsOfURL: url)!
//                            
//                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                                let image = UIImage(data: imageData)
//                                self.userImageButton.setBackgroundImage(image, forState: .Normal)
//
////                                self.profileImage.image = image
////                                user.image = image
//                            })
//                        })
//                    }
//                }
//            }
//        }
//    }
    
    class func identifier() -> String {
        return "DetailViewController"
    }
    
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var userNameTextLabel: UILabel!
    @IBOutlet weak var userImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupAppereance()
        setupTweetDetailViewController()
        setUpButtonImage()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupAppereance() {
        if self.tweet.isRetweet {
            if let rqUser = self.tweet?.rqUser?.name {
                self.navigationItem.title = rqUser
//                self.userImageButton.imageView = rqUser
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
        if let tweet = self.tweet, user = tweet.user, text = self.tweet?.text {
            ////                self.tweetTextLabel.text = text
            ////                self.userNameTextLabel.text = "Tweeted by: \(user.name)"

        
    if let image = user.image {
                            self.userImageButton.setBackgroundImage(image, forState: .Normal)
                        } else {
                            if let url = NSURL(string: user.profileImageURL) {
                                let downloadQ = dispatch_queue_create("downloadQ", nil)
                                dispatch_async(downloadQ, { () -> Void in
                                    let imageData = NSData(contentsOfURL: url)!
        
                                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                        let image = UIImage(data: imageData)
                                        self.userImageButton.setBackgroundImage(image, forState: .Normal)
        
        //                                self.profileImage.image = image
        //                                user.image = image
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

