//
//  Authentication.swift
//  Flash Chat
//
//  Created by Arman Abkar on 6/15/21.
//  Copyright © 2021 Arman Abkar. All rights reserved.
//

import UIKit
import Firebase

struct Authentication {
    
    static func login(email: String?, password: String?, sender: UIViewController) {
        if let email = email, let password = password {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    UIAlertController.showAlert(message: e.localizedDescription, from: sender)
                } else {
                    sender.performSegue(withIdentifier: Constants.loginSegue, sender: sender)
                }
            }
        }
    }
    
    static func register(email: String?, password: String?, sender: UIViewController) {
        if let email = email, let password = password {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let e = error {
                    UIAlertController.showAlert(message: e.localizedDescription, from: sender)
                } else {
                    sender.performSegue(withIdentifier: Constants.registerSegue, sender: sender)
                }
            }
        }
    }
    
    static func logout(sender: UIViewController, listener :ListenerRegistration?, navigationController: UINavigationController?) {
        do {
            try Auth.auth().signOut()
            listener?.remove()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            UIAlertController.showAlert(message: signOutError.localizedDescription, from: sender)
        }
    }
}
