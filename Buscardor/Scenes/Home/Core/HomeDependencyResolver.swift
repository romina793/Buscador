//
//  HomeDependencyResolver.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import Foundation

internal class HomeDependencyResolver: HomeDependencyResolverProtocol {
    
    internal func resolvePresenter() -> HomePresenterProtocol {
        return HomePresenter()
    }
    
}
