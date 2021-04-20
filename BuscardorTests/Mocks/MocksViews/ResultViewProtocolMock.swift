//
//  ResultViewProtocolMock.swift
//  BuscardorTests
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import Foundation
@testable import Buscardor

internal class ResultViewProtocolMock: ResultViewProtocol {
    
    var spyViewDidSetup = false
    var viewModelSetting = false
    var notFoundeIsDisplayed = false
    var errorIsDisplayed = false

    func setUp() {
        spyViewDidSetup = true
    }
    
    func setItemViewModel(item: [ItemViewModel]) {
        viewModelSetting = true
    }
    
    func showNotFoundController() {
        notFoundeIsDisplayed = true
    }
    
    func showFeedbackError() {
        errorIsDisplayed = true
    }
    
    
}
