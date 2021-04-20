//
//  DetailTests.swift
//  BuscardorTests
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import XCTest
@testable import Buscardor

internal class DetailTests: XCTestCase {
    
    let view = DetailViewProtocolMock()
    
    func testInitDetail() {
        XCTAssertNotNil(view.setUp())
    }
    
    func test_resolve_DetailPresenter() {
        let sut = makeSUT()
        var presenter: DetailPresenterProtocol
        
        XCTAssertNotNil(sut)
        
        presenter = sut.resolvePresenter()
        XCTAssertNotNil(presenter)
        XCTAssertTrue((presenter as Any) is DetailPresenterProtocol)
    }
    
    func test_resolve_DetailInteractor() {
        let sut = makeSUT()
        var interactor: DetailInteractorProtocol
        
        XCTAssertNotNil(sut)
        
        interactor = sut.resolveInteractor()
        XCTAssertNotNil(interactor)
        XCTAssertTrue((interactor as Any) is DetailInteractorProtocol)
    }
    
    func makeSUT() -> DetailDependencyResolverProtocol {
        return DetailDependencyResolver()
    }
}
