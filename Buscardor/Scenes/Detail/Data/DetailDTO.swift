//
//  DetailDTO.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation

struct DetailDTO: Codable {
    let price: Double?
    let currency_id: String?
    let condition: String?
    let title: String?
    let sold_quantity: Int?
    let pictures: [PicturesDTO]
}

struct PicturesDTO: Codable {
    let secure_url: String?
}
