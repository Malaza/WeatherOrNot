//
//  WeatherForecastResponse.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/09/01.
//

import Foundation

struct WeatherForecastResponse: Codable {
    
    var cod: String?
    var message: Int?
    var cnt: Int?
    var list: [ForecastResponse]?
    var city: CityResponse?
}

struct ForecastResponse: Codable {
    
    var dt: Int?
    var main: MainResponse?
    var weather: [WeatherResponse]?
    var clouds: CloudsResponse?
    var wind: WindResponse?
    var visibility: Int?
    var pop: Double?
    var rain: RainResponse?
    var sys: SysResponse?
    var dt_txt: String?
}

struct CityResponse: Codable {
    var id: Int?
    var name: String?
    var coord: CoordResponse?
    var country: String?
    var population: Int?
    var timezone: Int?
    var sunrise: Int?
    var sunset: Int?
}
  

