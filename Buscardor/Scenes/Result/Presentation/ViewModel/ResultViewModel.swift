//
//  ResultViewModel.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import Foundation

internal struct ResultViewModel {
    var result: [ItemViewModel]
}

internal struct ItemViewModel {
    var titleLabelText: String
    var subtitleLabelText: String
    var image: String
    let id: String
    let currencyId: String?
}
