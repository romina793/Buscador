//
//  HomeProtocols.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import Foundation

internal protocol HomePresenterProtocol {
    /**
     
     The view that is associated to the presenter
     
     */
    var view: HomeViewProtocol? { get set }
    
    /**
     
     Notifies that the view is ready and is waiting to present the initial data
     
     */
    func viewIsReady()
}

internal protocol HomeViewProtocol {
    /**

     Setup a view with a given view model that the view needs to be renderized

     */
    func setUp()
}

internal protocol HomeDependencyResolverProtocol {
    /**
     
     Returns de presenter
     
     - Returns: HomePresenterProtocol
     
     */
    func resolvePresenter() -> HomePresenterProtocol
}
