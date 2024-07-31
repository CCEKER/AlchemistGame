//
//  AlchemistGameView.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import UIKit

class AlchemistGameView: UIView {
    
    let collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.register(AlchemistGameCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.allowsMultipleSelection = true
        return view
    }()
    
    let combineButton: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("Combine", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.setBackgroundColor(.systemBlue, for: .normal)
        view.setBackgroundColor(.lightGray.withAlphaComponent(0.5), for: .disabled)
        view.titleLabel?.font = UIFont(name: "Roboto", size: 17)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.layer.cornerRadius = 3
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .systemBackground
        addSubview(collectionView)
        addSubview(combineButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: 112),
            
            combineButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            combineButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            combineButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            combineButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    color.setFill()
    UIRectFill(rect)
    let colorImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    setBackgroundImage(colorImage, for: state)
  }
}
