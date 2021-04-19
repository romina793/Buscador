//
//  DetailDependencyResolver.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation

internal class DetailDependencyResolver: DetailDependencyResolverProtocol {
    
    func resolvePresenter() -> DetailPresenterProtocol {
        return DetailPresenter(
            interactor: resolveInteractor())
    }
    
    //    MARK: - Interactor
    private func resolveInteractor() -> DetailInteractorProtocol {
        return DetailInteractor(
            mapper: resolveViewModelMapper())
    }
    
    //    MARK: - ViewModel Mapper
    private func resolveViewModelMapper() -> DetailViewModelMapperProtocol {
        return DetailViewModelMapper()
    }
    
}
