//
//  SignUpVC.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-23.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class SignUpVC: UIViewController {
    
//    MARK: - Properties
    let signUpView = SignUpView()

//    MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerView()
        
        setDelegates()
    }
    
    func registerView() {
        view = signUpView
    }
    
    func setDelegates() {
        signUpView.delegate = self
        signUpView.emailTextField.delegate = self
        signUpView.fullnameTextField.delegate = self
        signUpView.passwordTextField.delegate = self
    }
    
    deinit {
        print("DEBUG removing")
    }
}


extension SignUpVC: SignUpDelegate {
    func handleSignUpPressed(for view: SignUpView) {
        
    }
    
    func alreadyHaveAnAccountButton(_ button: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
