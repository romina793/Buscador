//
//  ResultCell.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 16/04/2021.
//

import UIKit

internal class ResultCell: UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
        
    // MARK: UI components
    private lazy var imageV: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: String.image)
        view.contentMode = .top
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textColor = UIColor.darkGray
        title.font = UIFont.systemFont(ofSize: 16, weight: .light)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    internal lazy var priceText: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.font = UIFont(name: "HelveticaNeue-Thin", size: 20.0)
        text.textColor = UIColor.black
        text.font = UIFont.systemFont(ofSize: 20, weight: .light)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
        
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        self.backgroundColor = UIColor.white

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ url: String) {
        !url.contains("https") ? setImageSecure(url) : imageV.downloaded(from: url)
    }
    
    private func setImageSecure(_ url: String) {
        var newUrl = url
        newUrl.insert("s", at: url.index(url.startIndex, offsetBy: 4))
        imageV.downloaded(from: newUrl)
    }

}
// MARK: Programmatically implementation
extension ResultCell: ProgrammaticallyProtocol {
    
    func setAddSubview() {
        addSubview(imageV)
        addSubview(titleLabel)
        addSubview(priceText)
    }
    
    func setUpConstraint() {
        let guide = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            imageV.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            imageV.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            imageV.trailingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor, constant: -16),
            imageV.heightAnchor.constraint(equalToConstant: 100),
            imageV.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.imageV.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            priceText.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16),
            priceText.leadingAnchor.constraint(equalTo: self.imageV.trailingAnchor, constant: 16),
            priceText.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
}

fileprivate extension String {
    static let image = "placeholder"
}
