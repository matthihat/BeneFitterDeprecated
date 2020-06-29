//
//  ProfileVC.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-21.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class ProfileVC: UIViewController {
    
//    MARK: - Properties
    lazy var signOutButton: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Log out", style: .plain, target: self, action: #selector(logOutUser))
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainYellow
        
        configureNavBar()
        
    }
    
    func configureNavBar() {
        navigationItem.rightBarButtonItem = signOutButton
        self.prefersLargeNCTitles()

    }
    
   @objc func logOutUser() {
        do {
            try Auth.auth().signOut()
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginVC())
                if #available(iOS 13.0, *) {
                    nav.isModalInPresentation = true
                }
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: false, completion: nil)
            }
        } catch {
            SVProgressHUD.showError(withStatus: error.localizedDescription)
        }
    }
}
