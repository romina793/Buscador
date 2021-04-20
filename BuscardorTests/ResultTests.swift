//
//  ResultTests.swift
//  BuscardorTests
//
//  Created by Romina Pozzuto on 19/04/2021.
//

import XCTest
@testable import Buscardor

internal class ResultTests: XCTestCase {
    
    func testInitResult() {
        let view = ResultViewController()
        XCTAssertNotNil(view.setUp())
    }
    
    func test_resolve_ResultPresenter() {
        let sut = makeSUT()
        var presenter: ResultPresenterProtocol
        
        XCTAssertNotNil(sut)
        
        presenter = sut.resolvePresenter()
        XCTAssertNotNil(presenter)
        XCTAssertTrue((presenter as Any) is ResultPresenterProtocol)
    }
    
    func test_resolve_ResultInteractor() {
        let sut = makeSUT()
        var interactor: ResultInteractorProtocol
        
        XCTAssertNotNil(sut)
        
        interactor = sut.resolveInteractor()
        XCTAssertNotNil(interactor)
        XCTAssertTrue((interactor as Any) is ResultInteractorProtocol)
    }
    
    func makeSUT() -> ResultDependencyResolverProtocol {
        return ResultDependencyResolver()
    }
    
}
