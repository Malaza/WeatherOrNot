//
//  WeatherPresenterTests.swift
//  WeatherOrNotTests
//
//  Created by Mthokozisi Malaza on 2023/09/02.
//

import XCTest
@testable import WeatherOrNot

final class WeatherPresenterTests: XCTestCase {
    
    var presenter: WeatherPresenter?
    
    override func setUpWithError() throws {
        let vc = WeatherViewController()
        let interactor = WeatherInteractor()
        let router = WeatherRouter()
        presenter = WeatherPresenter(interactor: interactor, router: router, view: vc)
    }
    
    func testThatPresenterInstantiated() throws {
        XCTAssertNotNil(presenter)
    }
    
    func testThatInteractorInstantiated() throws {
        XCTAssertNotNil(presenter?.interactor)
    }
    
    func testThatRouterInstantiated() throws {
        XCTAssertNotNil(presenter?.router)
    }

    func testThatVCInstantiated() throws {
        XCTAssertNotNil(presenter?.view)
    }

    override func tearDownWithError() throws {}
    
    func testPerformanceExample() throws {}
}
