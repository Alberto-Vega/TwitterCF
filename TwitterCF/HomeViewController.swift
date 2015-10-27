//
//  ViewController.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 10/26/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var tweets = [Tweet]()
    
    func identifier() -> String {
        return "HomeViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.getTweets()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func getTweets() {
        
        if let tweetJSONFileUrl = NSBundle.mainBundle().URLForResource("tweet", withExtension: "json") {
            
            print(tweetJSONFileUrl)
            
            if let tweetJSONData = NSData(contentsOfURL: tweetJSONFileUrl) {
                
                print(tweetJSONData)
                
                if let tweets = TweetJSONParser.tweetFromJSONData(tweetJSONData) {
                    
                    print(tweets)
                    
                    self.tweets = tweets
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // MARK: UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("num tweets")
        
        print(self.tweets.count)
        return self.tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as? TweetTableViewCell
        
        let tweet = self.tweets[indexPath.row]
        
        if let tweetCell = cell {
        
        tweetCell.userName?.text = tweet.userName
            print(tweet.profileImageURL)
    if let url = NSURL(string: "\(tweet.profileImageURL)") {
        
                if let data = NSData(contentsOfURL: url) {
//                    tweetCell.profileImage?.image.contentMode = UIViewContentMode.ScaleAspectFit
                    tweetCell.profileImage.image = UIImage(data: data)
                }
            }
//        tweetCell.profileImage?.image = tweet.profileImageURL
        tweetCell.tweetTextLabel?.text = tweet.text
        tweetCell.idLabel?.text = "Tweet id is: \(tweet.id)"
            

        }
        return cell!
    }

}

