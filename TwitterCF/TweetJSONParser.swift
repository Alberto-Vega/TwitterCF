//
//  TweetJSONParser.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 10/26/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class TweetJSONParser {
    
    class func tweetFromJSONData(json: NSData) -> [Tweet]? {
        
        do {
            
            if let rootObject = try NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.MutableContainers) as? [[String : AnyObject]] {
                
                print(rootObject)
                var tweets = [Tweet]()
                
                for tweetObject in rootObject {
                    if let text = tweetObject["text"] as? String,
                        id = tweetObject["id_str"] as? String ,
                        user = tweetObject["user"] as? [String:AnyObject],
                        userName = user["name"] as? String,
                        profileImageURLString = user["profile_image_url_https"] as? String,
                        profileImageURL = NSURL(string: profileImageURLString){
                            let tweet = Tweet(text: text, id: id, userName: userName, profileImageURL: profileImageURL)
                            tweets.append(tweet)
                    }
                }
                return tweets
            }
        } catch _ {}
        return nil
    }
}
