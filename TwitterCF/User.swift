//
//  User.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 10/27/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation
import UIKit

class User {
    let name: String
    let profileImageURL: String
    var image: UIImage?
    var backgroundProfileImage: String?
    var backgroundImage: UIImage?
    
    init(name: String, profileImageURL: String, backgroundImageURL: String) {
        self.name = name
        self.profileImageURL = profileImageURL
        self.backgroundProfileImage = backgroundImageURL
    }
}