//
//  AlertController.swift
//  Flash Chat
//
//  Created by Arman Abkar on 6/11/21.
//  Copyright © 2021 Arman Abkar. All rights reserved.
//

import UIKit

extension UIAlertController {
    static func showAlert(title: String? = "Error", message: String, from controller: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alertController.addAction(okAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
}
