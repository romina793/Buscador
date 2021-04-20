//
//  HomeTests.swift
//  BuscardorTests
//
//  Created by Romina Pozzuto on 15/04/2021.
//

import XCTest
@testable import Buscardor

internal class HomeTests: XCTestCase {

    func testInitHome() {
        let view = HomeViewController()
        XCTAssertNotNil(view.setUp())
    }
    
    func test_resolve_HomePresenter() {
        let sut = makeSUT()
        var presenter: HomePresenterProtocol
        
        XCTAssertNotNil(sut)
        
        presenter = sut.resolvePresenter()
        XCTAssertNotNil(presenter)
        XCTAssertTrue((presenter as Any) is HomePresenterProtocol)
    }
    
    func makeSUT() -> HomeDependencyResolverProtocol {
        return HomeDependencyResolver()
    }
    
}
