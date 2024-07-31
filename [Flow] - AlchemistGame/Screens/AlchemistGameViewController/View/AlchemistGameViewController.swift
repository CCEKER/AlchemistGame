//
//  AlchemistGameViewController.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 15.05.2024.
//

import UIKit

protocol AlchemistGameViewControllerProtocol: AnyObject {
    func displayCellViewModels(_ viewModels: [ElementCellViewModel], isCombineButtonEnabled: Bool)
}

class AlchemistGameViewController: UIViewController, AlchemistGameCollectionViewCellDelegate {
    
    private let customView = AlchemistGameView()
    private let interactor: AlchemistGameInteractorProtocol
    private var collectionData: [ElementCellViewModel] = []
    
    init(interactor: AlchemistGameInteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Alchemist Game"
        
        customView.combineButton.addTarget(self, action: #selector(didTapCombineButton), for: .touchUpInside)
        
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        
        interactor.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.viewDidLoad()
    }
        
    @objc private func didTapCombineButton() {
        interactor.didTapCombineButton()
    }
    
    func didTapElement(_ element: Element) {
        interactor.didTapElement(element)
    }
}

extension AlchemistGameViewController: AlchemistGameViewControllerProtocol {
    
    func displayCellViewModels(_ viewModels: [ElementCellViewModel], isCombineButtonEnabled: Bool) {
        self.collectionData = viewModels
        customView.combineButton.isEnabled = isCombineButtonEnabled
        customView.collectionView.reloadData()
    }
}

extension AlchemistGameViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlchemistGameCollectionViewCell
        cell.delegate = self
        let element = collectionData[indexPath.row]
        cell.reloadWith(element)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.frame.width - 150) / 2, height: 162)
    }
}
