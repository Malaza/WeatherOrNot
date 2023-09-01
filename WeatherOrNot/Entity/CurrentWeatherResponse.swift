//
//  CurrentWeatherResponse.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/31.
//

import Foundation


struct CurrentWeatherResponse: Codable {
    var coord: CoordResponse?
    var weather: WeatherResponse?
    var base: String?
    var main: MainResponse?
    var visibility: Int?
    var wind: WindResponse?
    var rain: RainResponse?
    var clouds: CloudsResponse?
    var dt: Int?
    var sys: SysResponse?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Int?
}

struct CoordResponse: Codable {
    var lon: Double?
    var lat: Double?
}

struct WeatherResponse: Codable {
    var id: String?
    var main: String?
    var description: String?
    var icon: String?
}

struct MainResponse: Codable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
    var sea_level: Int?
    var grnd_level: Int?
}

struct WindResponse: Codable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
}

struct RainResponse: Codable {
    var hour1: Double?
}

struct CloudsResponse: Codable {
    var all: Int?
}

struct SysResponse: Codable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}
