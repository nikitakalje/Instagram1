//
//  ViewController.swift
//  Instagram
//
//  Created by Nikita Kalje on 8/19/20.
//  Copyright © 2020 Nikita Kalje. All rights reserved.
//

import FirebaseAuth
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //handleNotAuthenticated()
        notAuth()
        
        do {
            try Auth.auth().signOut()
        }
        catch {
            print("Could not sign out")
        }

    }
    
    private func notAuth() {
        //Check auth status
        if Auth.auth().currentUser == nil {
            //Show log in
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
            
        }
    }

}
//hello testing

