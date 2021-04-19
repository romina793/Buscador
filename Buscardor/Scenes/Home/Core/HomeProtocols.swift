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
    
    func viewIsReady()
}

internal protocol HomeViewProtocol {
    func setUp()
}

internal protocol HomeDependencyResolverProtocol {
    /**
     
     Returns de presenter
     
     - Returns: HomePresenterProtocol
     
     */
    func resolvePresenter() -> HomePresenterProtocol
}
