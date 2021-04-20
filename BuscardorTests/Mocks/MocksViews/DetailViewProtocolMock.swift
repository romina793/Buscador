//
//  DetailViewProtocolMock.swift
//  BuscardorTests
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import Foundation
@testable import Buscardor

internal class DetailViewProtocolMock: DetailViewProtocol {
    
    var spyViewDidSetup = false
    var viewModelSetting = false
    var errorIsDisplayed = false

    
    func setUp() {
        spyViewDidSetup = true
    }
    
    func setDetailViewModel(_ viewModel: DetailViewModel) {
        viewModelSetting = true
    }
    
    func showFeedbackError() {
        errorIsDisplayed = true
    }
    
    
}

