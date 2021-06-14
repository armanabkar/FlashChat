//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Arman Abkar on 5/8/21.
//  Copyright © 2021 Arman Abkar. All rights reserved.
//


import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        Authentication.register(email: emailTextfield.text, password: passwordTextfield.text, sender: self)
    }
    
}
