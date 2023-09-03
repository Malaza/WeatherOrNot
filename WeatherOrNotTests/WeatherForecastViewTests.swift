//
//  WeatherForecastViewTests.swift
//  WeatherOrNotTests
//
//  Created by Mthokozisi Malaza on 2023/09/03.
//

import XCTest
@testable import WeatherOrNot

final class WeatherForecastViewTests: XCTestCase {
    
    var view: WeatherForecastView?
    var defaultTextColor = UIColor.white
    var defaultFont = UIFont.systemFont(ofSize: 18, weight: .medium)
    var forecasts : [ForecastModel] = []
    
    override func setUpWithError() throws {
        let weatherView = WeatherForecastView()
        view = weatherView
        forecasts = [ForecastModel(temp: "20"),
                     ForecastModel(temp: "35"),
                     ForecastModel(temp: "40"),
                     ForecastModel(temp: "19"),
                     ForecastModel(temp: "17") ]
    }
    
    func testThatForecastConfiguresProperly() {
        view?.configureForecastView(model: forecasts)
        XCTAssertEqual(view?.tuesdayWeatherLabel.text, "20")
        XCTAssertEqual(view?.wednesdayWeatherLabel.text, "35")
        XCTAssertEqual(view?.thursdayWeatherLabel.text, "40")
        XCTAssertEqual(view?.fridayWeatherLabel.text, "19")
        XCTAssertEqual(view?.saturdayWeatherLabel.text, "17")
    }

    func testThatTuesdayImageViewIsInstantiated() {
        XCTAssertNotNil(view?.tuesdayImageView)
    }
    
    func testThatTuesdayWeatherLabelIsInstantiated() {
        XCTAssertNotNil(view?.tuesdayWeatherLabel)
        XCTAssertEqual(view?.tuesdayWeatherLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.tuesdayWeatherLabel.font, defaultFont)
    }
    
    func testThatTuesdayLabelIsInstantiated() {
        XCTAssertNotNil(view?.tuesdayLabel)
        XCTAssertEqual(view?.tuesdayLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.tuesdayLabel.font, defaultFont)
    }
    
    func testThatWednesdayImageViewIsInstantiated() {
        XCTAssertNotNil(view?.wednesdayImageView)
    }
    
    func testThatWednesdayWeatherLabelIsInstantiated() {
        XCTAssertNotNil(view?.wednesdayWeatherLabel)
        XCTAssertEqual(view?.wednesdayWeatherLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.wednesdayWeatherLabel.font, defaultFont)
    }
    
    func testThatWednesdayLabelIsInstantiated() {
        XCTAssertNotNil(view?.wednesdayLabel)
        XCTAssertEqual(view?.wednesdayLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.wednesdayLabel.font, defaultFont)
    }
    
    func testThatThursdayImageViewIsInstantiated() {
        XCTAssertNotNil(view?.thursdayImageView)
    }
    
    func testThatThursdayWeatherLabelIsInstantiated() {
        XCTAssertNotNil(view?.thursdayWeatherLabel)
        XCTAssertEqual(view?.thursdayWeatherLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.thursdayWeatherLabel.font, defaultFont)
    }
    
    func testThatThursdayLabelIsInstantiated() {
        XCTAssertNotNil(view?.thursdayLabel)
        XCTAssertEqual(view?.thursdayLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.thursdayLabel.font, defaultFont)
    }
    
    func testThatFridayImageViewIsInstantiated() {
        XCTAssertNotNil(view?.fridayImageView)
    }
    
    func testThatFridayWeatherLabelIsInstantiated() {
        XCTAssertNotNil(view?.fridayWeatherLabel)
        XCTAssertEqual(view?.fridayWeatherLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.fridayWeatherLabel.font, defaultFont)
    }
    
    func testThatFridayLabelIsInstantiated() {
        XCTAssertNotNil(view?.fridayLabel)
        XCTAssertEqual(view?.fridayLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.fridayLabel.font, defaultFont)
    }
    
    func testThatSaturdayImageViewIsInstantiated() {
        XCTAssertNotNil(view?.saturdayImageView)
    }
    
    func testThatSaturdayWeatherLabelIsInstantiated() {
        XCTAssertNotNil(view?.saturdayWeatherLabel)
        XCTAssertEqual(view?.saturdayWeatherLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.saturdayWeatherLabel.font, defaultFont)
    }
    
    func testThatSaturdayLabelIsInstantiated() {
        XCTAssertNotNil(view?.saturdayLabel)
        XCTAssertEqual(view?.saturdayLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.saturdayLabel.font, defaultFont)
    }
    
    func testThatViewIsInstantiated() {
        XCTAssertNotNil(view?.tuesdayLabel)
        XCTAssertEqual(view?.tuesdayLabel.textColor, defaultTextColor)
        XCTAssertEqual(view?.tuesdayLabel.font, defaultFont)
    }
    
    override func tearDownWithError() throws {}

    func testExample() throws {}

    func testPerformanceExample() throws {}

}
