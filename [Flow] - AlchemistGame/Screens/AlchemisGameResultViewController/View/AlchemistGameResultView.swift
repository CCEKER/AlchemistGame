//
//  AlchemistGameResultView.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 20.05.2024.
//

import UIKit

class AlchemistGameResultView: UIView {
    
    private let selectedElementCountTitle: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: "Roboto", size: 17)
        view.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let infoLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: "Roboto", size: 17)
        view.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        view.textAlignment = .center
        return view
    }()

    private lazy var iconStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [])
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.alignment = .fill
        view.spacing = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let outcome: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: "Roboto", size: 50)
        view.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var verticalStack: UIStackView = {
        let view = UIStackView(arrangedSubviews: [infoLabel, outcome])
        view.axis = .vertical
        view.spacing = 10
        view.alignment = .center
        view.distribution = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let restartButton: UIButton = {
        let view = UIButton(type: .system)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .systemBlue
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
        addSubview(iconStackView)
        addSubview(selectedElementCountTitle)
        addSubview(verticalStack)
        addSubview(restartButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            selectedElementCountTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 45),
            selectedElementCountTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 101),
            selectedElementCountTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -101),
            
            iconStackView.topAnchor.constraint(equalTo: selectedElementCountTitle.bottomAnchor, constant: 10),
            iconStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 92),
            iconStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -92),
            
            verticalStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            verticalStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            restartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            restartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            restartButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -30),
            restartButton.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    func reloadWith(_ viewModel: AlchemistGameResultViewModel) {
        viewModel.selectedIcons.forEach { icon in
            let view = UIImageView()
            view.contentMode = .scaleAspectFit
            view.clipsToBounds = true
            view.image = UIImage(named: icon)
            iconStackView.addArrangedSubview(view)
        }
        selectedElementCountTitle.text = viewModel.selectedElementCountTitle
        restartButton.setTitle(viewModel.restartButtonTitle, for: .normal)
        infoLabel.text = viewModel.infoLabel
        outcome.text = viewModel.outcome
    }
}
