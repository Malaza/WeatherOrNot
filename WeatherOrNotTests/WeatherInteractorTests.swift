//
//  WeatherInteractorTests.swift
//  WeatherOrNotTests
//
//  Created by Mthokozisi Malaza on 2023/09/02.
//

import XCTest
@testable import WeatherOrNot

enum TestError: Error {
    case interactorInstantiationFailed
}

final class WeatherInteractorTests: XCTestCase {
    
    var interactor: WeatherInteractor?
    
    override func setUpWithError() throws {
        let vc = WeatherViewController()
        interactor = WeatherInteractor()
        let router = WeatherRouter()
        guard let nonEmptyInteractor = interactor else { throw TestError.interactorInstantiationFailed }
        let presenter = WeatherPresenter(interactor: nonEmptyInteractor, router: router, view: vc)
        vc.presenter = presenter
        interactor?.presenter = presenter
    }

    
    
    func testThatServiceIsAvailable() throws {
        XCTAssertNotNil(interactor?.service)
    }

    func testThatInteractorInstantiated() throws {
        XCTAssertNotNil(interactor?.presenter)
    }
    
    func testThatRouterInstantiated() throws {
        XCTAssertNotNil(interactor?.presenter?.router)
    }

    func testThatVCInstantiated() throws {
        XCTAssertNotNil(interactor?.presenter?.view)
    }
    
    func testPerformanceExample() throws {}
    
    override func tearDownWithError() throws {
        interactor = nil
    }
}
