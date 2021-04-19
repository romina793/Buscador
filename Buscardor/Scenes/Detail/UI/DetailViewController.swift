//
//  DetailViewController.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 16/04/2021.
//

import UIKit

internal class DetailViewController: BaseViewController, UIScrollViewDelegate, DetailViewProtocol {
    
    internal var id: String? = ""
    private var viewModel: DetailViewModel?
    private var imagelist: [String] = []
    private var textCondition: String = ""
    private var number: Int = 0

    private var presenter: DetailPresenterProtocol
    private var dependencyResolver: DetailDependencyResolverProtocol
    
    // MARK: UI components
    private lazy var pageControl: UIPageControl = {
        let view = UIPageControl()
        view.numberOfPages = imagelist.count
        view.currentPage = 0
        view.pageIndicatorTintColor = UIColor.systemGray6
        view.currentPageIndicatorTintColor = UIColor.hexStringToUIColor(hex: .primary)
        view.addTarget(self, action: Selector(("changePage:")), for: UIControl.Event.valueChanged)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(
            frame: CGRect(x: 0,
                          y: 0,
                          width: self.view.frame.width,
                          height: 300))
        view.delegate = self
        view.showsHorizontalScrollIndicator = false
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "placeholder")
        view.contentMode = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var conditionLabel: UILabel = {
        let title = UILabel()
        title.text = "\(textCondition)"
        title.textColor = UIColor.lightGray
        title.font = UIFont.systemFont(ofSize: 14, weight: .light)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var soldQuantityLabel: UILabel = {
        let title = UILabel()
        if number > 0 {
            title.text = " | \(number) vendidos"
        }
        title.textColor = UIColor.lightGray
        title.font = UIFont.systemFont(ofSize: 14, weight: .light)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.text = viewModel?.title
        title.textColor = UIColor.darkGray
        title.font = UIFont.systemFont(ofSize: 18, weight: .light)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var priceText: UILabel = {
        let text = UILabel()
        text.numberOfLines = 0
        text.text = viewModel?.price
        text.font = UIFont(name: "HelveticaNeue-Thin", size: 32.0)
        text.font = UIFont.systemFont(ofSize: 32, weight: .light)
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    //MARK: Lifecycle
    init(dependencyResolver: DetailDependencyResolverProtocol = DetailDependencyResolver()) {
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
        presenter.detailProduct(id ?? "")
    }
    
    func setDetailViewModel(_ viewModel: DetailViewModel) {
        self.viewModel = viewModel
        for i in viewModel.pictures {
            imagelist.append(i.secureUrl)
        }
        switch viewModel.condition {
        case "new":
            textCondition = "Nuevo"
        case "used":
            textCondition = "Usado"
        default:
            textCondition = ""
        }
        number = viewModel.soldQuantity
    }
    
    func setUp() {
        setUpView()
        setInitConfiguration()
    }
    
    func setFormatterNumber() {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        switch viewModel?.currencyId {
        case "USD":
            formatter.currencySymbol = "U$S "
        default:
            formatter.currencySymbol = "$ "
        }
        formatter.minimumFractionDigits = 0
        guard let double = Double(priceText.text ?? "") else {return}
        var result = formatter.string(from: NSNumber(value: double))
        result = result?.replacingOccurrences(of: ",", with: ".")
        priceText.text = result
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = UIColor.white
    }
    
    func setInitConfiguration() {
        addImageScrollView()
        setContentSizeScrollView()
    }
    
    func addImageScrollView() {
        if imagelist.isEmpty {
            view.addSubview(imageView)
        } else {
            for  i in stride(from: 0, to: imagelist.count, by: 1) {
                var frame = CGRect.zero
                frame.origin.x = self.scrollView.frame.size.width * CGFloat(i)
                frame.origin.y = 0
                frame.size = self.scrollView.frame.size
                self.scrollView.isPagingEnabled = true
                
                let imageV: UIImageView = UIImageView()
                imageV.downloaded(from: imagelist[i])
                imageV.contentMode = .scaleAspectFit
                imageV.frame = frame
                scrollView.addSubview(imageV)
            }
        setFormatterNumber()
        }
    }
    
    func setContentSizeScrollView() {
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * CGFloat(imagelist.count), height: self.scrollView.frame.size.height)
    }

    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
}

extension DetailViewController: ProgrammaticallyProtocol {
    
    func setAddSubview(){
        view.addSubview(conditionLabel)
        view.addSubview(soldQuantityLabel)
        view.addSubview(titleLabel)
        view.addSubview(priceText)
        view.addSubview(pageControl)
        view.addSubview(scrollView)
    }
    
    func setUpConstraint(){
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            conditionLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            conditionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            conditionLabel.trailingAnchor.constraint(equalTo: self.soldQuantityLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            soldQuantityLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
            soldQuantityLabel.leadingAnchor.constraint(equalTo: self.conditionLabel.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: soldQuantityLabel.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 300),
            scrollView.widthAnchor.constraint(equalToConstant: self.view.frame.width)
        ])

        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 16),
            pageControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.pageControl.bottomAnchor, constant: 16),
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
