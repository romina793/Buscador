//
//  DetailViewModel.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation

internal struct DetailViewModel {
    let price: String
    let currencyId: String
    let condition: String
    let title: String
    let soldQuantity: Int
    let pictures: [PicturesViewModel]
}

internal struct PicturesViewModel {
    let secureUrl: String
}
