//
//  SceneDelegate.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let currentUser = Auth.auth().currentUser
        if currentUser != nil {
            let storyboard = UIStoryboard(name: K.storyboardName, bundle: nil);
            let chatViewController: ChatViewController = storyboard.instantiateViewController(withIdentifier: K.chatViewIdentifier) as! ChatViewController;
            let rootViewController = self.window!.rootViewController as! UINavigationController;
            rootViewController.pushViewController(chatViewController, animated: true);
        }
        
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
    }
    
}

