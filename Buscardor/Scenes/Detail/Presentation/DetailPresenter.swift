//
//  DetailPresenter.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation

internal class DetailPresenter: DetailPresenterProtocol {

    internal var view: DetailViewProtocol?
    private var interactor: DetailInteractorProtocol


    init(interactor: DetailInteractorProtocol) {
        self.interactor = interactor
    }
    
    func detailProduct(_ id: String) {
        interactor.detailProduct(with: id) { (model) in
            self.view?.setDetailViewModel(model)
            self.view?.setUp()
        } onFailure: { (error) in
            #warning("WIP")
        }
    }
}
