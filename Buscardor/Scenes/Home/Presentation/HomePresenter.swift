//
//  HomePresenter.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import Foundation

internal class HomePresenter: HomePresenterProtocol {

    internal var view: HomeViewProtocol?
    
    internal init() {}

    internal func viewIsReady(){
        view?.setUp()
    }

    
}
