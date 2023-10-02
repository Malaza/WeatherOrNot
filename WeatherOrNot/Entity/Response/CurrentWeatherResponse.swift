//
//  CurrentWeatherResponse.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/31.
//

import Foundation


struct CurrentWeatherResponse: Decodable {
    var coord: CoordResponse?
    var weather: [WeatherResponse]?
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

struct CoordResponse: Decodable {
    var lon: Double?
    var lat: Double?
}

struct WeatherResponse: Decodable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct MainResponse: Decodable {
    var temp: Double?
    var temp_kf: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
    var sea_level: Int?
    var grnd_level: Int?
}

struct WindResponse: Decodable {
    var speed: Double?
    var deg: Int?
    var gust: Double?
}

struct RainResponse: Decodable {
    var hour1: Double?
}

struct CloudsResponse: Decodable {
    var all: Int?
}

struct SysResponse: Decodable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}
