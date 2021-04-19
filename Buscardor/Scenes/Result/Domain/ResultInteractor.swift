//
//  ResultInteractor.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import Foundation
import Alamofire

internal class ResultInteractor: ResultInteractorProtocol {
    
    private let mapper: ResultViewModelMapperProtocol
    
        internal init(mapper: ResultViewModelMapperProtocol) {
            self.mapper = mapper
        }
    
    internal func fetchProduct(with product: String, onSuccess: @escaping ([ItemViewModel]) -> Void, onFailure: @escaping (AFError) -> Void)  {
        var url = String.Request.path + product
        url = url.replacingOccurrences(of: " ", with: "%20")
        AF.request(url)
        .validate()
        .responseDecodable(of: ResultDTO.self) { (response) in
            DispatchQueue.main.async {
                if let decodedObject = response.value {
                    let list = decodedObject.results ?? []
                    let model = self.mapper.mapResultItem(from: list)
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
        static let path = "https://api.mercadolibre.com/sites/MLA/search?q="
    }
}
