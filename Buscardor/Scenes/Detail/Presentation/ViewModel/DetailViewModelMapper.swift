//
//  DetailViewModelMapper.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation

internal class DetailViewModelMapper: DetailViewModelMapperProtocol{
    
    // MARK: DetailDTO Mapping
    internal func map(from model: DetailDTO) -> DetailViewModel {
        return DetailViewModel(
            price: mapPrice(from: model),
            currencyId: mapCurrencyId(from: model),
            condition: mapCondition(from: model),
            title: mapTitle(from: model),
            soldQuantity: mapSouldQuantity(from: model),
            pictures: mapPicture(from: model.pictures ))
    }
    
    private func mapPrice(from item: DetailDTO) -> String {
        return String(item.price ?? 0)
    }
    
    private func mapCurrencyId(from item: DetailDTO) -> String {
        return item.currencyId ?? ""
    }
    
    private func mapCondition(from item: DetailDTO) -> String {
        return item.condition ?? ""
    }
    
    private func mapTitle(from item: DetailDTO) -> String {
        return item.title ?? ""
    }
    
    private func mapSouldQuantity(from item: DetailDTO) -> Int {
        return item.soldQuantity ?? 0
    }
    
    // MARK: PicturesDTO Mapping
    private func mapPicture(from model: [PicturesDTO]) -> [PicturesViewModel] {
        var section: [PicturesViewModel] = []
        model.forEach({
            section.append(
                PicturesViewModel(secureUrl: mapImage(from: $0))
            )
        })
        return section
    }
    
    private func mapImage(from item: PicturesDTO) -> String {
        return item.secureUrl ?? ""
    }

}
