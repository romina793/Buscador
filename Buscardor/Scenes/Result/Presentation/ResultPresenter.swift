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


    internal init(interactor: ResultInteractorProtocol) {
        self.interactor = interactor
    }
    
    internal func searchProduct(_ product: String) {
        interactor.fetchProduct(with: product) { (model) in
            if model.isEmpty {
                self.view?.showNotFoundController()
            } else {
                self.view?.setItemViewModel(item: model)
                self.view?.setUp()
            }

        } onFailure: { (error) in
            print("ResultPresenter -> ⚠️ Cannot search - Error: \(error)")
            self.view?.showFeedbackError()
        }
    }
}
