//
//  CustomUserTimelineHeader.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 11/1/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import UIKit


class CustomUserTimelineHeader: UITableViewHeaderFooterView {
    
//    static let customUserTimelineHeader = CustomUserTimelineHeader()
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    
//    static var userProfileName: String! {
//        didSet {
//            if let userProfileName = userProfileName {
//                customUserTimelineHeader.userName.text = userProfileName
//            }
//        }
//    }
//    static var userImage: UIImage!

        
        
    
//    static var tweet: Tweet? {
//        didSet {
//            if let tweet = self.tweet, user = tweet.user {
////                self.userName.text = "Tweeted by: \(user.name)"
//                self.userProfileName = "Tweeted by: \(user.name)"
//
//                if let image = user.image {
////                    self.userProfileImage.image = image
////                    self.userImage = image
//                } else {
//                    if let url = NSURL(string: user.profileImageURL) {
//                        let downloadQ = dispatch_queue_create("downloadQ", nil)
//                        dispatch_async(downloadQ, { () -> Void in
//                            let imageData = NSData(contentsOfURL: url)!
//                            
//                            dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                                let image = UIImage(data: imageData)
////                                self.userProfileImage.image = image
//                                user.image = image
//                                self.userImage = image
//
//                                
//                            })
//                        })
//                    }
//                }
//            }
//        }
//    }
    
    class func view() -> UIView {
        return UINib(nibName: "UserTimelineHeader", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
}