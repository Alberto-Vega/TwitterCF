//
//  LoginService.swift
//  TwitterCF
//
//  Created by Alberto Vega Gonzalez on 10/27/15.
//  Copyright © 2015 Alberto Vega Gonzalez. All rights reserved.
//

import Foundation
import Accounts

typealias TwitterLoginCompletion = (String?, ACAccount?) -> ()

class LoginService {
    
    class func loginTwitter(completionHandler: TwitterLoginCompletion) {
        
        let accountStore = ACAccountStore()
        let accountType = accountStore.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccountsWithType(accountType, options: nil, completion: { (granted, error) -> Void in
            
            if let _ = error {
                completionHandler("ERROR: Request access to accounts returned an error.", nil); return
            }
            
            if granted {
                if let account = accountStore.accountsWithAccountType(accountType).first as? ACAccount {
                    completionHandler(nil, account); return
                }
                completionHandler("ERROR: No twitter accouns were found on this device.", nil); return
            }
        })
    }
}