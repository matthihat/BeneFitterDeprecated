//
//  Protocols.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-22.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit

protocol SignUpDelegate: class {
    func handleSignUpPressed(_ signUpButton: UIButton, _ fullnameTextField: UITextField, _ emailTextField: UITextField, _ passwordTextField: UITextField)
    
    func alreadyHaveAnAccountButton(_ button: UIButton)
}

protocol LoginDelegate: class {
    func didPressLogin(_ emailTextField: UITextField, _ passwordTextField: UITextField)
    func didPressDontHaveAccountButton(_ button: UIButton)
}
