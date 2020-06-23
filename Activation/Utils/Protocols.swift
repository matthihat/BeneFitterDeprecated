//
//  Protocols.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-22.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit

protocol SignUpDelegate: class {
    func handleSignUpPressed(for view: SignUpView)
    func alreadyHaveAnAccountButton(_ button: UIButton)
}

protocol LoginDelegate {
    func didPressLogin(_ emailTextField: UITextField, _ passwordTextField: UITextField)
    func didPressDontHaveAccountButton(_ button: UIButton)
}
