//
//  DetailViewModel.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation

struct DetailViewModel {
    let price: String
    let currencyId: String
    let condition: String
    let title: String
    let soldQuantity: Int
    let pictures: [PicturesViewModel]
}

struct PicturesViewModel {
    let secureUrl: String
}
