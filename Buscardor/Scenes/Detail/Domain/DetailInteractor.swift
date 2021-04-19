//
//  DetailInteractor.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 18/04/2021.
//

import Foundation
import Alamofire

internal class DetailInteractor: DetailInteractorProtocol {
    
    private let mapper: DetailViewModelMapperProtocol
    
    internal init(mapper: DetailViewModelMapperProtocol) {
        self.mapper = mapper
    }
    
    func detailProduct(with id: String, onSuccess: @escaping (DetailViewModel) -> Void, onFailure: @escaping (AFError) -> Void)  {
        let url = String.Request.path + id
        AF.request(url)
            .validate()
            .responseDecodable(of: DetailDTO.self) { (response) in
                DispatchQueue.main.async {
                    if let decodedObject = response.value {
                        let model = self.mapper.map(from: decodedObject)
                        onSuccess(model)
                    } else {
                        guard let error = response.error else {return}
                        onFailure(error)
                    }
                }
            }
    }
}

fileprivate extension String {
    struct Request {
        static let path = "https://api.mercadolibre.com/items/"
    }
}
