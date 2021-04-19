//
//  DetailDTO.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation

internal struct DetailDTO: Codable {
    let price: Double?
    let currencyId: String?
    let condition: String?
    let title: String?
    let soldQuantity: Int?
    let pictures: [PicturesDTO]
    
    enum CodingKeys: String, CodingKey {
        case price
        case currencyId = "currency_id"
        case condition
        case title
        case soldQuantity = "sold_quantity"
        case pictures
    }
}

internal struct PicturesDTO: Codable {
    let secureUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case secureUrl = "secure_url"
    }
}
