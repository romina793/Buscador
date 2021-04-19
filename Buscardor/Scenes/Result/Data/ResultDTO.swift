//
//  SearchDTO.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import UIKit

internal struct ResultDTO: Codable {
  let results: [ItemDTO]?
}

internal struct ItemDTO: Codable {
    let price: Double?
    let title: String?
    let image: String?
    let id: String?
    let currencyId: String?
    
    enum CodingKeys: String, CodingKey {
        case price
        case title
        case image = "thumbnail"
        case id
        case currencyId = "currency_id"
        
    }
}
