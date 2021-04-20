//
//  BaseViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import UIKit

internal class BaseViewController: UIViewController {
    
    // MARK: UI components
    private lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.searchBarStyle = .minimal
        search.searchTextField.backgroundColor = UIColor.white
        search.backgroundColor = UIColor.hexStringToUIColor(hex: .primary)
        search.delegate = self
        search.searchTextField.textColor = UIColor.darkGray
        search.placeholder = String.placeHolder
        search.searchTextField.autocapitalizationType = .none
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setColor()
        setBackImage()
        setCancelButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchBar.endEditing(true)
    }
    
    internal func setColor() {
        view.backgroundColor = UIColor.hexStringToUIColor(hex: .primary)
        navigationController?.navigationBar.barTintColor = UIColor.hexStringToUIColor(hex: .primary)
    }
    
    internal func setBackImage() {
        guard var backImage = UIImage(named: "arrow") else {return}
        backImage = resizeImage(image: backImage, newWidth: 40) ?? UIImage()
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    internal func setCancelButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancelar", style: .plain, target: self, action: #selector(tapCancel))
    }
    
    @objc func tapCancel() {
        searchBar.endEditing(true)
    }
    
    internal func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}

extension BaseViewController: UISearchBarDelegate {
    
    internal func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let controller = ResultViewController()
        controller.itemSearch = self.searchBar.text ?? ""
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

fileprivate extension String {
    static let placeHolder = "Buscar en Mercado Libre"
}
