//
//  ResultProtocols.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import Foundation
import Alamofire

internal protocol ResultViewModelMapperProtocol {
    /**
     
     ViewModelMapper
     
     - Parameters: ItemDTO
     - Returns: ItemViewModel
     
     */
    func mapResultItem(from model: [ItemDTO]) -> [ItemViewModel] 
}

internal protocol ResultViewProtocol {
    /**

     Setup a view with a given view model that the view needs to be renderized

     */
    func setUp()
    
    /**

     Setup a view with a given view model that the view needs to be renderized

     - Parameters:
     - item: The model that the view need's to be renderized

     */
    func setItemViewModel(item: [ItemViewModel])
    
    /**

     Setup not found screen

     */
    func showNotFoundController()
        
    /**

     Setup error screen

     */
    func showFeedbackError()
    
}

internal protocol ResultPresenterProtocol {
    /**
     
     The view that is associated to the presenter
     
     */
    var view: ResultViewProtocol? { get set }
    
    /**
     
     Notifies that the view is ready and is waiting to present the initial data
     
     - Parameters:
     - product: Search for the entered product
     
     */
    func searchProduct(_ product: String)
}

internal protocol ResultDependencyResolverProtocol {
    /**
     
     Returns de presenter
     
     - Returns: ResultPresenterProtocol
     
     */
    func resolvePresenter() -> ResultPresenterProtocol
    
    /**
     
     Returns de interactor
     
     - Returns: ResultInteractorProtocol
     
     */
    func resolveInteractor() -> ResultInteractorProtocol
}

internal protocol ResultInteractorProtocol {
    /// Internactor
    /// - Parameters:
    ///   - product: String product entered
    ///   - success: success [ItemViewModel]
    ///   - failure: failure AFError
    func fetchProduct(with product: String, onSuccess: @escaping ([ItemViewModel]) -> Void, onFailure: @escaping (AFError) -> Void)
}
