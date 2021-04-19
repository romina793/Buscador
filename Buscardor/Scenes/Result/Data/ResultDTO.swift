//
//  SearchDTO.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import UIKit

struct ResultDTO: Codable {
  let results: [ItemDTO]?
}

struct ItemDTO: Codable {
    let price: Double?
    let title: String?
    let thumbnail: String?
    let id: String?
    let currency_id: String?
}
