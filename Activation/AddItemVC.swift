//
//  AddItemVC.swift
//  Activation
//
//  Created by Mattias Törnqvist on 2020-06-21.
//  Copyright © 2020 Mattias Törnqvist. All rights reserved.
//

import UIKit

class NewChallengeView: UIView {
    
//    MARK: - Properties
    let typeOfChallengeCV: UICollectionView
    
//    MARK: - Init
    init(typeOfChallengeCV: UICollectionView) {
        self.typeOfChallengeCV = typeOfChallengeCV
        super.init(frame: CGRect.zero)
        
        backgroundColor = .yellow
        
        configureUI()
    }
    
    required init?(coder: NSCoder, typeOfChallengeCV: UICollectionView) {
        self.typeOfChallengeCV = typeOfChallengeCV
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubviews(typeOfChallengeCV)
        
        typeOfChallengeCV.anchor(top: topAnchor, paddingTop: 64, width: 244, height: 120)
        typeOfChallengeCV.centerX(inView: self)
    }
    
}

class NewChallengeVC: UIViewController {
    
//    MARK: - Properties
    
    let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 4
//        layout.itemSize = CGSize(width: 120, height: 120)
        
        return layout
        //        let frame = CGRect(x: 0, y: 0, width: 0, height: 220)
    }()
    
    let frame: CGRect = {
        let frame = CGRect.zero
        return frame
    }()
    
    lazy var typeOfChallengeCV: UICollectionView = {
        let cv = UICollectionView.collectionView(with: layout, with: frame)
        return cv
    }()
    
    var typeOfChallengeDelegateAndDataSource: TypeOfChallengeDelegateAndDataSource?
    
    override func viewDidLoad() {
        
        configureView()
        
        configureCollectionView()
    }
    
    func configureView() {
        let view = NewChallengeView(typeOfChallengeCV: typeOfChallengeCV)
        self.view = view
    }
    
    func configureCollectionView() {
        typeOfChallengeDelegateAndDataSource = TypeOfChallengeDelegateAndDataSource(typeOfChallengeCV)
        typeOfChallengeCV.delegate = typeOfChallengeDelegateAndDataSource
        typeOfChallengeCV.dataSource = typeOfChallengeDelegateAndDataSource
        
        typeOfChallengeCV.register(TopChallengeCell.self, forCellWithReuseIdentifier: TopChallengeCell.identifier)
    }
}

class TypeOfChallengeDelegateAndDataSource: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView
    
    init(_ collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopChallengeCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 120, height: 120)
    }
    
}
