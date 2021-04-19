//
//  ResultViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 16/04/2021.
//

import UIKit

internal class ResultViewController: BaseViewController {
    
    var selectedItem: ItemViewModel?
    var items: [ItemViewModel] = []
    var list: [ItemDTO] = []
    var itemSearch: String = ""
    
    // MARK: UI components
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = UIColor.systemGray6
        table.showsVerticalScrollIndicator = false
        table.register(ResultCell.self, forCellReuseIdentifier: ResultCell.identifier)
        return table
    }()
    
    
    private var presenter: ResultPresenterProtocol
    private var dependencyResolver: ResultDependencyResolverProtocol
    

    //MARK: Lifecycle
    init(dependencyResolver: ResultDependencyResolverProtocol = ResultDependencyResolver()) {
        self.dependencyResolver = dependencyResolver
        self.presenter = dependencyResolver.resolvePresenter()
        super.init(nibName: nil, bundle: nil)
        presenter.view = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.searchProduct(itemSearch)
    }
    
}

extension ResultViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier, for: indexPath) as? ResultCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.setImage(item.image)
        cell.titleLabel.text = item.titleLabelText
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        switch item.currencyId {
        case "USD":
            formatter.currencySymbol = "U$S "
        default:
            formatter.currencySymbol = "$ "
        }
        formatter.minimumFractionDigits = 0
        let double = Double(item.subtitleLabelText )
        var result = formatter.string(from: double! as NSNumber)!
        result = result.replacingOccurrences(of: ",", with: ".")
        cell.priceText.text = result
        cell.selectionStyle = .none
        return cell
    }
    
    private func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.id = selectedItem?.id
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = items[indexPath.row]
        return indexPath
    }
    
    internal func reloadTableView() {
        self.tableView.reloadData()
    }

}

extension ResultViewController: ResultViewProtocol {
    
    func setItemViewModel(item: [ItemViewModel]) {
        self.items = item
    }
    
    func setUp() {
        setUpView()
    }
}


// MARK: Programmatically implementation
extension ResultViewController: ProgrammaticallyProtocol {
    
    func setAddSubview() {
        view.addSubview(tableView)
    }
    
    func setUpConstraint() {
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
}

fileprivate extension String {
    static let title = ""
}
