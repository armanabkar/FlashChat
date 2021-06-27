//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Arman Abkar on 5/8/21.
//  Copyright © 2021 Arman Abkar. All rights reserved.
//


import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    var listener: ListenerRegistration?
    var messages: [Message] = []
    var colorsForEachUser = [String: UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        listener = db.collection(K.Firestore.collectionName)
            .order(by: K.Firestore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
                self.messages = []
                
                if let e = error {
                    UIAlertController.showAlert(message: e.localizedDescription, from: self)
                } else {
                    if let snapshotDocuments = querySnapshot?.documents {
                        for doc in snapshotDocuments {
                            let data = doc.data()
                            if let messageSender = data[K.Firestore.senderField] as? String,
                               let messageBody = data[K.Firestore.bodyField] as? String {
                                let newMessage = Message(sender: messageSender, body: messageBody)
                                self.messages.append(newMessage)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                                }
                            }
                        }
                    }
                }
            }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.Firestore.collectionName).addDocument(data: [
                K.Firestore.senderField: messageSender,
                K.Firestore.bodyField: messageBody,
                K.Firestore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    UIAlertController.showAlert(message: e.localizedDescription, from: self)
                } else {
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            listener?.remove()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            UIAlertController.showAlert(message: signOutError.localizedDescription, from: self)
        }
    }
    
}


// MARK: - UITableViewDataSource

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightBlue)
            cell.label.textColor = UIColor(named: K.BrandColors.blue)
            cell.label.text = message.body
        }
        else {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.blue)
            cell.label.textColor = UIColor(named: K.BrandColors.lightBlue)
            let senderLabel = "\(message.sender)\n"
            cell.label.text = senderLabel + "\(message.body)"
            if !(colorsForEachUser[message.sender] != nil) {
                colorsForEachUser[message.sender] = .random()
            }
            cell.label.setSubTextColor(pSubString: senderLabel, pColor: colorsForEachUser[message.sender] ?? .black, pWeight: .semibold)
        }
        
        return cell
    }
    
}


