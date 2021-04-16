//
//  HomeViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 16/04/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: UI components
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = String.placeHolder
        search.searchBarStyle = UISearchBar.Style.prominent
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        view.backgroundColor = UIColor.white
    }

    
}

// MARK: Programmatically implementation
extension HomeViewController {
    
    func setUpView() {
        setAddSubview()
        setUpConstraint()
    }
    
    func setAddSubview() {
        view.addSubview(searchBar)
    }
    
    func setUpConstraint() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 60),
            searchBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
    
}

fileprivate extension String {
    static let placeHolder = "Buscar en Mercado Libre"
}
