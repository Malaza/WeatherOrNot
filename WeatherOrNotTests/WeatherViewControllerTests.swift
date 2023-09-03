//
//  WeatherViewControllerTests.swift
//  WeatherOrNotTests
//
//  Created by Mthokozisi Malaza on 2023/09/03.
//

import XCTest
@testable import WeatherOrNot

final class WeatherViewControllerTests: XCTestCase {
    
    var weatherViewController: WeatherViewController?
    
    override func setUpWithError() throws {
        let weatherView = WeatherRouter.setupModule()
        weatherViewController = weatherView
    }

    override func tearDownWithError() throws {}

    func testThatVCInstantiated() throws {
        XCTAssertNotNil(weatherViewController)
    }
    
    func testThatPresenterInstantiated() throws {
        XCTAssertNotNil(weatherViewController?.presenter)
    }

    func testThatLocationManagerInstantiated() throws {
        weatherViewController?.viewDidLoad()
        XCTAssertNotNil(weatherViewController?.locationManager)
    }
    
    func testPerformanceExample() throws {}

}
