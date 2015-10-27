//
//  Tweet.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 10/26/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation

class Tweet {
    let text: String
    let id: String
    let userName: String
    let profileImageURL: NSURL
    
    init(text: String, id: String, userName: String, profileImageURL: NSURL) {
        self.text = text
        self.id = id
        self.userName = userName
        self.profileImageURL = profileImageURL
    }
}
