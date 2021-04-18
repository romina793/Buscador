//
//  HomeViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 16/04/2021.
//

import UIKit

internal class HomeViewController: BaseViewController {
    
    // MARK: UI components
    private lazy var imageV: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "launch-screen")
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

}

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
