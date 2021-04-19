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
        
    private lazy var imageV: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "placeholder")
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
        text.font = UIFont.systemFont(ofSize: 20, weight: .light)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
        
    // MARK: Initalizers
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(_ url: String) {
        var newUrl = url
//        agregar validación para ver si viene sin la s
        newUrl.insert("s", at: url.index(url.startIndex, offsetBy: 4))
        imageV.downloaded(from: newUrl)
    }
    
    private func setupViews() {
        buildViewHierarchy()
        setupConstraints()
    }

    private func buildViewHierarchy(){
        addSubview(imageV)
        addSubview(titleLabel)
        addSubview(priceText)
    }

    private func setupConstraints(){
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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
