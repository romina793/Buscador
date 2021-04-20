//
//  HomeViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 16/04/2021.
//

import UIKit

internal class HomeViewController: BaseViewController {
    
    private var presenter: HomePresenterProtocol
    private var dependencyResolver: HomeDependencyResolverProtocol
    
    // MARK: UI components
    private lazy var imageV: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: String.image)
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: Initalizers
    internal init(dependencyResolver: HomeDependencyResolverProtocol = HomeDependencyResolver()) {
        self.dependencyResolver = dependencyResolver
        self.presenter = dependencyResolver.resolvePresenter()
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewIsReady()
    }

}

// MARK: HomeViewProtocol
extension HomeViewController: HomeViewProtocol {
    
    func setUp() {
        setUpView()
    }
}

// MARK: Programmatically implementation
extension HomeViewController: ProgrammaticallyProtocol {
    func setAddSubview() {
        view.addSubview(imageV)
    }
    
    func setUpConstraint() {
        NSLayoutConstraint.activate([
            imageV.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            imageV.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
}

fileprivate extension String {
    static let image = "launch-screen"
}
