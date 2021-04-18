//
//  DetailViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 16/04/2021.
//

import UIKit

internal class DetailViewController: BaseViewController {
    
    var data: ItemViewModel?
    
    // MARK: UI components
    private lazy var imageV: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "placeholder")
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.text = data?.titleLabelText
        title.font = UIFont.systemFont(ofSize: 18, weight: .light)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var priceText: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.text = data?.subtitleLabelText
        text.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        let url = data?.image
        var newUrl = url
        newUrl?.insert("s", at: (url?.index(url!.startIndex, offsetBy: 4))!)
        imageV.downloaded(from: newUrl ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
    }
    
}

extension DetailViewController: ProgrammaticallyProtocol {
    
    func setAddSubview(){
        view.addSubview(imageV)
        view.addSubview(titleLabel)
        view.addSubview(priceText)
    }
    
    func setUpConstraint(){
        
        NSLayoutConstraint.activate([
            imageV.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150),
            imageV.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            imageV.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.imageV.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            priceText.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            priceText.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            priceText.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        ])
        
    }
    
}
