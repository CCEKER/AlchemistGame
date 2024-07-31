//
//  AlchemistGameCollectionViewCell.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import UIKit

protocol AlchemistGameCollectionViewCellDelegate: AnyObject {
    func didTapElement(_ element: Element)
}

class AlchemistGameCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: AlchemistGameCollectionViewCellDelegate?
    private var element: Element?
    
    private lazy var holderView: UIView = {
        let view = UIView()
        view.backgroundColor = .holder
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 56
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
        return view
    }()
    
    private let elementTitle: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Roboto", size: 30)
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let elementIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    @objc private func didTapView() {
        
        guard let element else { return }
        delegate?.didTapElement(element)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.contentView.backgroundColor = .clear
        contentView.addSubview(holderView)
        contentView.addSubview(elementTitle)
        holderView.addSubview(elementIcon)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            holderView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            holderView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50),
            holderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            holderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            holderView.heightAnchor.constraint(equalToConstant: 112),
            
            elementTitle.topAnchor.constraint(equalTo: holderView.bottomAnchor, constant: 20),
            elementTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            elementTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            elementIcon.centerYAnchor.constraint(equalTo: holderView.centerYAnchor),
            elementIcon.centerXAnchor.constraint(equalTo: holderView.centerXAnchor)
        ])
    }
    
    func reloadWith(_ viewModel: ElementCellViewModel) {
        elementTitle.text = viewModel.element.rawValue
        elementIcon.image = UIImage(named: viewModel.element.rawValue)
        holderView.backgroundColor = viewModel.isSelected ? .systemBlue : .holder
        self.element = viewModel.element
    }
}
