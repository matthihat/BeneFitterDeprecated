//
//  AddItemVC.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-21.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit

class AddVChallengeView: UIView {
    
//    MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class AddChallengeVC: UIViewController {
    
    override func viewDidLoad() {
        view.backgroundColor = .systemYellow
    }
}
