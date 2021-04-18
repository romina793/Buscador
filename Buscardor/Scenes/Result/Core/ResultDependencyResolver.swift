//
//  ResultDependencyResolver.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import Foundation

internal class ResultDependencyResolver: ResultDependencyResolverProtocol {
    
    func resolvePresenter() -> ResultPresenterProtocol {
        return ResultPresenter(
            interactor: resolveInteractor())
    }
    
    //    MARK: - Interactor
    private func resolveInteractor() -> ResultInteractorProtocol {
        return ResultInteractor(
            mapper: resolveViewModelMapper())
    }
    
    //    MARK: - ViewModel Mapper
    private func resolveViewModelMapper() -> ResultViewModelMapperProtocol {
        return ResultViewModelMapper()
    }
    
}
