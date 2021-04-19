//
//  ResultPresenter.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import Foundation

internal class ResultPresenter: ResultPresenterProtocol {

    internal var view: ResultViewProtocol?
    private var interactor: ResultInteractorProtocol


    init(interactor: ResultInteractorProtocol) {
        self.interactor = interactor
    }
    
    func searchProduct(_ product: String) {
        interactor.fetchProduct(with: product) { (model) in
            self.view?.setItemViewModel(item: model)
            self.view?.setUp()
        } onFailure: { (error) in
            #warning("WIP")
        }
    }
}
