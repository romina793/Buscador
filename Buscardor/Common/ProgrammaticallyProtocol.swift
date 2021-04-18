//
//  ProgrammaticallyProtocol.swift
//  Buscardor
//
//  Created by Romina Pozzuto on 17/04/2021.
//

import Foundation

internal protocol ProgrammaticallyProtocol {
    func setUpView()
    func setAddSubview()
    func setUpConstraint()
    func setUpAdditionalConfigs()
}

extension ProgrammaticallyProtocol {
    
    func setUpView() {
        setAddSubview()
        setUpConstraint()
        setUpAdditionalConfigs()
    }
    
    func setUpAdditionalConfigs() {}
}
