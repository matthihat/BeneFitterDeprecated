//
//  ProfileVC.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-21.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        configureNavBar()
        print("DEBUG added")
        
    }
    
    deinit {
        print("DEBUG deinit")
    }
    
    func configureNavBar() {
//        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
