//
//  AlchemistGameResultViewController.swift
//  AlchemistGame
//
//  Created by Cagatay Ceker on 20.05.2024.
//

import UIKit

protocol AlchemistGameResultViewControllerProtocol: AnyObject {
    func displayViewModel(_ viewModel: AlchemistGameResultViewModel)
}

class AlchemistGameResultViewController: UIViewController {
    
    private let customView = AlchemistGameResultView()
    private let interactor: AlchemistGameResultInteractorProtocol
    
    init(interactor: AlchemistGameResultInteractorProtocol) {
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
        
        configureNavigationBar()
        
        customView.restartButton.addTarget(self, action: #selector(didTapRestartButton), for: .touchUpInside)
        
        interactor.viewDidLoad()
    }
    
    @objc private func didTapRestartButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureNavigationBar() {
        self.title = "Result"
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
    }
}

extension AlchemistGameResultViewController: AlchemistGameResultViewControllerProtocol {
    
    func displayViewModel(_ viewModel: AlchemistGameResultViewModel) {
        customView.reloadWith(viewModel)
    }
}
