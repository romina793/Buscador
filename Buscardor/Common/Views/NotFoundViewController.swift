//
//  NotFoundViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import UIKit

internal class NotFoundViewController: BaseViewController {
    
    // MARK: UI components
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: String.image)
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = String.title
        title.textAlignment = .center
        title.numberOfLines = 0
        title.textColor = UIColor.darkGray
        title.font = UIFont.systemFont(ofSize: 24, weight: .light)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let title = UILabel()
        title.text = String.description
        title.textColor = UIColor.lightGray
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize: 18, weight: .light)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.systemGray6
        navigationController?.navigationBar.isHidden = false
    }
    
}

// MARK: Programmatically implementation
extension NotFoundViewController: ProgrammaticallyProtocol {
    
    func setAddSubview() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
    }
    
    func setUpConstraint() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 24),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
    
}

fileprivate extension String {
    static let image = "magnifying_glass"
    static let title = "No encontramos publicaciones"
    static let description = "Revisa que la palabra esté bien escrita. También puedes probar con menos términos o más generales"
}
