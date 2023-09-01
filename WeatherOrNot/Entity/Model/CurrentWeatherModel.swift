//
//  CurrentWeatherModel.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/09/01.
//

import Foundation

enum CurrentWeatherType: String {
    case cloudy = "cloudy"
    case rainy = "rainy"
    case sunny = "sunny"
}

class CurrentWeatherModel {
    var temp: String!
    var tempMin: String!
    var tempMax: String!
    var mainWeather: String!
    var type: CurrentWeatherType = .sunny
}
