//
//  ResultViewModelMapper.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import Foundation

internal class ResultViewModelMapper: ResultViewModelMapperProtocol{
    
    // MARK: ItemDTO Mapping
    func mapResultItem(from model: [ItemDTO]) -> [ItemViewModel] {
        var section: [ItemViewModel] = []
        model.forEach({
            section.append(
                ItemViewModel(
                    titleLabelText: mapTitleItem(from: $0),
                    subtitleLabelText: mapPrice(from: $0),
                    image: mapImage(from: $0),
                    id: mapId(from: $0),
                    currencyId: mapCurrencyId(from: $0))
            )
        })
        return section
    }
    
    private func mapTitleItem(from item: ItemDTO) -> String {
        return item.title ?? ""
    }
    
    private func mapPrice(from item: ItemDTO) -> String {
        return String(item.price ?? 0)
    }
    
    private func mapImage(from item: ItemDTO) -> String {
        return item.thumbnail ?? ""
    }
    
    private func mapId(from item: ItemDTO) -> String {
        return item.id ?? ""
    }
    
    private func mapCurrencyId(from item: ItemDTO) -> String {
        return item.currency_id ?? ""
    }

}

