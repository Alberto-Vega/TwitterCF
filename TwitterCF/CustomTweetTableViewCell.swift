//
//  TweetTableViewCell.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 10/27/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit

class CustomTweetTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    
    var tweet: Tweet? {
        didSet {
            if let tweet = self.tweet, user = tweet.user, text = self.tweet?.text {
                self.tweetTextLabel.text = text
                
                if let image = user.image {
                    self.imageView?.image = image
                } else {
                    if let url = NSURL(string: user.profileImageURL) {
                        let downloadQ = dispatch_queue_create("downloadQ", nil)
                        dispatch_async(downloadQ, { () -> Void in
                            let imageData = NSData(contentsOfURL: url)!
                            
                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                                let image = UIImage(data: imageData)
                                self.imageView?.image = image
                                user.image = image
                            })
                        })
                    }
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func identifier() -> String {
        return "CustomTweetTableViewCell"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
