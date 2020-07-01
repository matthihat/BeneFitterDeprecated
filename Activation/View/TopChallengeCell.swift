//
//  TypeOfChallengeCell.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-30.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit

class TopChallengeCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
//            contentView.layer.borderColor = isSelected ? UIColor.blue.cgColor :  UIColor.clear.cgColor
        }
    }
    
//    MARK: - Properties
    static let identifier = "Identifier"
    let cornerRadius: CGFloat = 12
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundBlack
        view.layer.borderWidth = 1
        view.layer.cornerRadius = cornerRadius
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowRadius = 2
        view.layer.shadowOpacity = 0.8
        return view
    }()
    
    private let popularLabel: UILabel = {
        let label = UILabel()
        label.text = "Most popular"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 22)
        return label
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "HLF-logotyp")
        return iv
    }()
    
    
    private let joinButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Join", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 20
        button.setHeight(to: 40)
        button.setWidth(to: 100)
        return button
    }()
    
//    MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helper functions
    func configureUI() {
        contentView.backgroundColor = .none
        contentView.layer.cornerRadius = cornerRadius
        
        addSubviews(bgView, joinButton)
        
        let bgFrame = CGRect(x: 5, y: 5,
                             width: contentView.frame.width - 10, height: contentView.frame.height - 25)
        bgView.frame = bgFrame
        
        bgView.addSubviews(popularLabel, imageView)
        popularLabel.centerX(inView: bgView)
        popularLabel.anchor(top: bgView.topAnchor,
                            paddingTop: 8)
        
        imageView.anchor(top: popularLabel.bottomAnchor,
                         right: bgView.rightAnchor,
//                         MARK: - TODO Scale image instead of neg. padding top and big height
                         paddingTop: -30,
                         paddingRight: 8,
                         width: 120,
                         height: 120)

        joinButton.centerX(inView: bgView)
        joinButton.centerYAnchor.constraint(equalTo: bgView.bottomAnchor).isActive = true
    }
}
