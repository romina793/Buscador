//
//  DetailProtocols.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation
import Alamofire

internal protocol DetailViewModelMapperProtocol {
    /**
     
     ViewModelMapper
     
     - Parameters: DetailDTO
     - Returns: DetailViewModelDetailViewModel
     
     */
    func map(from model: DetailDTO) -> DetailViewModel
}

internal protocol DetailViewProtocol {
    /**

     Setup a view with a given view model that the view needs to be renderized

     */
    func setUp()
    
    /**

     Setup a view with a given view model that the view needs to be renderized

     - Parameters:
     - viewModel: The model that the view need's to be renderized

     */
    func setDetailViewModel(_ viewModel: DetailViewModel)
    
    /**

     Setup error screen

     */
    func showFeedbackError()
    
}

internal protocol DetailPresenterProtocol {
    /**
     
     The view that is associated to the presenter
     
     */
    var view: DetailViewProtocol? { get set }
    
    /**
     
     Notifies that the view is ready and is waiting to present the initial data
     
     - Parameters:
     - id: id for the selected product
     
     */
    func detailProduct(_ id: String)
    
}

internal protocol DetailDependencyResolverProtocol {
    /**
     
     Returns de presenter
     
     - Returns: DetailPresenterProtocol
     
     */
    func resolvePresenter() -> DetailPresenterProtocol
    
    /**
     
     Returns de interactor
     
     - Returns: DetailInteractorProtocol
     
     */
    func resolveInteractor() -> DetailInteractorProtocol
}

internal protocol DetailInteractorProtocol {
    /// Internactor
    /// - Parameters:
    ///   - id: String 
    ///   - success: success [DetailViewModel]
    ///   - failure: failure AFError
    func detailProduct(with id: String, onSuccess: @escaping (DetailViewModel) -> Void, onFailure: @escaping (AFError) -> Void)
}
