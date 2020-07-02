//
//  TypeOfChallengeCell.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-30.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit

class TopChallengeCell: UICollectionViewCell {
    
    let challengeGoal = ChallengeGoal.mostCaloriesBurnt.topChallengeGoal
    let challengeBet = ChallengeGoal.mostCaloriesBurnt
    let duration = Duration.twentyFourHours
    
//    MARK: - TODO create database with top challenge, add functions to fetch top model from db. Create webpage with admin login for editing new top challenges
    lazy var topChallenge = TopChallengeModel(image: #imageLiteral(resourceName: "HLF-logotyp"),
                                             titleLabel: "Hjärt- & lungfonden",
                                             textBody: "Aid the fight against heart and lung disease by joining this challenge",
                                             typeOfChallenge: .mostCaloriesBurnt,
                                             challengeGoal: challengeGoal,
                                             duration: Duration.twentyFourHours,
                                             bet: challengeBet)

    
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
        view.layer.shadowColor = UIColor.darkGray.cgColor
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
    
    private let textBody: UITextView = {
        let txtView = UITextView()
        txtView.text = "Loading"
        txtView.textColor = .white
        txtView.backgroundColor = .backgroundBlack
        txtView.font = .boldSystemFont(ofSize: 12)
        txtView.isUserInteractionEnabled = false
        txtView.isScrollEnabled = false
        return txtView
    }()
    
    private let goalLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let betLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
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
        
        configureLabels()
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
        
        bgView.addSubviews(popularLabel, textBody, goalLabel, betLabel, imageView)
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
        
        textBody.anchor(top: popularLabel.bottomAnchor,
                        left: bgView.leftAnchor,
//                        bottom: bgView.bottomAnchor,
                        right: self.centerXAnchor,
                        paddingTop: 8,
                        paddingLeft: 8,
//                        paddingBottom: 8,
                        paddingRight: 8)
        
        goalLabel.anchor(top: textBody.bottomAnchor,
                         left: textBody.leftAnchor)
        
        betLabel.anchor(top: goalLabel.bottomAnchor,
                        left: goalLabel.leftAnchor,
                        paddingTop: 4)

        joinButton.centerX(inView: bgView)
        joinButton.centerYAnchor.constraint(equalTo: bgView.bottomAnchor).isActive = true
    }
    
    func configureLabels() {
        textBody.text = topChallenge.textBody
        
        let goalAndDurationText = NSMutableAttributedString(string: "Finish")
        let goalText = NSAttributedString(string: String(topChallenge.challengeGoal),
                                          attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemRed.cgColor])
        let spacer = NSAttributedString(string: " ")
        let units = NSAttributedString(string: ChallengeGoal.mostCaloriesBurnt.topChallengeDescription)
        let inString = NSAttributedString(string: "in")
        let duration = NSAttributedString(string: String(topChallenge.duration.durationInHours),
                                          attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemRed.cgColor])
        let hours = NSAttributedString(string: "h")
        
        let donateText = NSMutableAttributedString(string: "Donate ")
        let bet = NSAttributedString(string: String(topChallenge.bet.topChallengeBet),
                                     attributes: [NSAttributedString.Key.foregroundColor : UIColor.systemYellow.cgColor])
        let end = NSAttributedString(string: " kr if you succeed")
        
        goalAndDurationText.appendMultiple(NSAttributedStrings: spacer, goalText, spacer, units, spacer, inString, spacer, duration, spacer, hours)
        goalLabel.attributedText = goalAndDurationText
        
        donateText.appendMultiple(NSAttributedStrings: bet, end)
        betLabel.attributedText = donateText
        
    }
}
