//
//  LoginViewController.swift
//  Instagram
//
//  Created by Nikita Kalje on 8/19/20.
//  Copyright © 2020 Nikita Kalje. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    private let usernameEmailField: UITextField = {
        return UITextField()
    }()
    
    private let passField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        return UIButton()
    }()
    
    private let termsButton: UIButton = {
        return UIButton()
    }()
    
    private let privacyButton: UIButton = {
        return UIButton()
    }()
    
    private let accountButton: UIButton = {
        return UIButton()
    }()
    
    private let headerView: UIView = {
        return UIView()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        // Do any additional setup after loading the view.
    
        view.backgroundColor = .systemBackground
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
    }
    
    private func addSubviews() {
        view.addSubview(usernameEmailField)
        view.addSubview(passField)
        view.addSubview(loginButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
         view.addSubview(accountButton)
        view.addSubview(headerView)
        
    }
    
    //objc so it can be exposed to buttons
    @objc private func didTapLoginButton() {}
        @objc private func didTapTermsButton() {}
        @objc private func didTapPrivacyButton() {}
        @objc private func didTapAccountButton() {}

}
