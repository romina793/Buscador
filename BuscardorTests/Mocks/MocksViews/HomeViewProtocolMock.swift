//
//  HomeViewProtocolMock.swift
//  BuscardorTests
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import Foundation
@testable import Buscardor

internal class HomeViewProtocolMock: HomeViewProtocol {
    
    var spyViewDidSetup = false

    func setUp() {
        spyViewDidSetup = true
    }
    
    
}
