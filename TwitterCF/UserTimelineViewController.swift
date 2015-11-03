//
//  UserTimelineViewController.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 10/30/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class UserTimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerBackgroundImage: UIImageView!
    @IBOutlet weak var userProfileImageHeader: UIImageView!
    @IBOutlet weak var userNameHeaderLabel: UILabel!
    
    var tweets = [Tweet]()
    var selectedTweet: Tweet!
    
    func identifier() -> String {
        return "UserTimeLineViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.getTweets()
    }
    
    func getTweets() {
        if let user = selectedTweet.user {
            TwitterService.tweetsFromUserTimeLineForUsername(user.name) { (error, tweets) -> () in
                
                if let error = error {
                    print(error)
                    return
                }
                
                if let tweets = tweets {
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        self.tweets = tweets
                        self.tableView.reloadData()
                    })
                }
            }
        }
    }
    
    func setupTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 101
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let spinner = UIRefreshControl(frame: CGRectMake(0.0, 0.0, 44.0, 44.0))
        
        spinner.addTarget(self, action: "updateFeed:", forControlEvents: UIControlEvents.AllEvents)
        self.tableView.addSubview(spinner)
        
        let refreshButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "getTweets")
        navigationItem.rightBarButtonItem = refreshButton
        
        let customTweetCellXib = UINib(nibName: "CustomTweetCell", bundle: NSBundle.mainBundle())
        self.tableView.registerNib(customTweetCellXib, forCellReuseIdentifier: CustomTweetTableViewCell.identifier())
        
        self.userProfileImageHeader.image = self.selectedTweet.user?.image
        self.userNameHeaderLabel.text = self.selectedTweet.user?.name
        self.headerBackgroundImage.image = self.selectedTweet.user?.backgroundImage
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomTweetTableViewCell", forIndexPath: indexPath) as! CustomTweetTableViewCell
        cell.tweet = tweets[indexPath.row]
        return cell
    }
}
