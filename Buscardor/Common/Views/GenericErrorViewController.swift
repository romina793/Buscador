//
//  GenericErrorViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import UIKit

internal class GenericErrorViewController: BaseViewController {
    
    private var onMainButtonTap:() -> Void

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
    
    lazy var retryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reintentar", for: .normal)
        button.addTarget(self, action: #selector(tapMain), for: .touchUpInside)
        button.setTitleColor(UIColor.hexStringToUIColor(hex: .secondary), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Initalizers
    init(onMainButtonTap: @escaping () -> Void ) {
        self.onMainButtonTap = onMainButtonTap
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.hexStringToUIColor(hex: .ligthGray)
        navigationController?.navigationBar.isHidden = false
    }
    
    @objc func tapMain() {
        onMainButtonTap()
    }
    
}

// MARK: Programmatically implementation
extension GenericErrorViewController: ProgrammaticallyProtocol {
    
    func setAddSubview() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(retryButton)
    }
    
    func setUpConstraint() {
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 150),
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
        
        NSLayoutConstraint.activate([
            retryButton.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 34),
            retryButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            retryButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
    }
    
}

fileprivate extension String {
    static let image = "wifi"
    static let title = "¡Parece que no hay internet!"
    static let description = "Revisa tu conexión para seguir navegando"
}
