//
//  LoginViewController.swift
//  Instagram
//
//  Created by Nikita Kalje on 8/19/20.
//  Copyright © 2020 Nikita Kalje. All rights reserved.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {

    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    private let usernameEmailField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or Email..."
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password..."
               field.returnKeyType = .continue
               field.leftViewMode = .always
               field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
               field.autocapitalizationType = .none
               field.autocorrectionType = .no
               field.layer.masksToBounds = true
               field.layer.cornerRadius = Constants.cornerRadius
               field.layer.borderWidth = 1.0
               field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    

    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let termsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let privacyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let accountButton: UIButton = {
        let button = UIButton()
        //label color adapts for dark mode or light mode
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Make an Account", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        //header.backgroundColor = .red
        let backgroundImageView = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.addTarget(self,
                              action: #selector(didTapLoginButton),
                              for: .touchUpInside)
        
        accountButton.addTarget(self,
                              action: #selector(didTapAccountButton),
                              for: .touchUpInside)
        
        termsButton.addTarget(self,
                              action: #selector(didTapTermsButton),
                              for: .touchUpInside)
        
        privacyButton.addTarget(self,
                              action: #selector(didTapPrivacyButton),
                              for: .touchUpInside)
        
        usernameEmailField.delegate = self
        passField.delegate = self
        addSubviews()
        // Do any additional setup after loading the view.
    
        view.backgroundColor = .systemBackground
    
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
        
        
        
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3.0)
        
        usernameEmailField.frame = CGRect(x: 25,
                                  y: headerView.bottom + 40,
                                  width: view.width-50,
                                  height: 52)
        
        passField.frame = CGRect(x: 25,
                                  y: usernameEmailField.bottom + 10,
                                  width: view.width-50,
                                  height: 52)
        
        loginButton.frame = CGRect(x: 25,
                                  y: passField.bottom + 10,
                                  width: view.width-50,
                                  height: 52)
        
        accountButton.frame = CGRect(x: 25,
                                  y: loginButton.bottom + 10,
                                  width: view.width-50,
                                  height: 52)
        
        termsButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom-100,
                                   width: view.width-20,
                                   height: 50)
        
        privacyButton.frame = CGRect(x: 10,
                                   y: view.height-view.safeAreaInsets.bottom-50,
                                   width: view.width-20,
                                   height: 50)
        configureHeaderView()
        
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        //add the ig logo
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
        
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
    @objc private func didTapLoginButton() {
        passField.resignFirstResponder()
        usernameEmailField.resignFirstResponder()
        
        guard let userEmail = usernameEmailField.text, !userEmail.isEmpty,
        
            let pass = passField.text, !pass.isEmpty, pass.count >= 8 else {
                return
        }
        
        var username: String?
        var email: String?
        
        //login functionality
        if userEmail.contains("@"), userEmail.contains(".") {
            //email
            email = userEmail
        }
        else {
            //username
            username = userEmail
        }
        
        
        AuthManager.shared.loginUser(username: username, email: email, password: pass) { success in
            DispatchQueue.main.async {
                if success {
                        //user has logged in
                    self.dismiss(animated: true, completion: nil)
                    }
                    
                    else {
                        //an error ocurred
                        let alert = UIAlertController(title: "Log In Error",
                                                      message: "Unable to log you in",
                                                      preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                    }
                }
            }
            
        
    }
        @objc private func didTapTermsButton() {
            //use let bc string could be null
            guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
    }
        @objc private func didTapPrivacyButton() {
            
            //use let bc string could be null
            guard let url = URL(string: "https://help.instagram.com/519522125107875?helpref=page_content") else {
                return
            }
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
    }
        @objc private func didTapAccountButton() {
            
            let vc = RegistrationViewController()
            vc.title = "Create Account"
            
            present(UINavigationController(rootViewController: vc), animated: true)
            //present(vc, animated: true)
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailField {
            passField.becomeFirstResponder()
        }
        else if textField == passField {
            didTapLoginButton()
        }
        
        return true
    }
}
