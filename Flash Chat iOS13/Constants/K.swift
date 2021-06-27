//
//  Constants.swift
//  Flash Chat 
//
//  Created by Arman Abkar on 5/8/21.
//  Copyright © 2021 Arman Abkar. All rights reserved.
//

import Foundation

struct K {
    
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    static let storyboardName = "Main"
    static let chatViewIdentifier = "ChatScreen"
    
    struct BrandColors {
        static let blue = "BrandBlue"
        static let lightBlue = "BrandLightBlue"
    }
    
    struct error {
        static let title = "Error"
        static let invalidFieldMessage = "Please enter a valid username/password."
    }
    
    struct Firestore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
}
