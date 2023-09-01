//
//  CurrentWeatherResponse.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/31.
//

import Foundation


struct CurrentWeatherResponse: Codable {
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

struct CoordResponse: Codable {
    var lon: Double?
    var lat: Double?
}

struct WeatherResponse: Codable {
    var id: Int?
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



//Optional(["weather": <__NSSingleObjectArrayI 0x600001105150>(
//{
//    description = "clear sky";
//    icon = 01d;
//    id = 800;
//    main = Clear;
//}
//)
//, "sys": {
//    country = ZA;
//    id = 1928;
//    sunrise = 1693542978;
//    sunset = 1693584428;
//    type = 1;
//},
//"dt": 1693552153, "visibility": 10000, "timezone": 7200,
//"wind": {
//    deg = 216;
//    gust = "5.32";
//    speed = "5.35";
//},
//"clouds": {
//    all = 0;
//},
//"base": stations,
//"coord": {
//    lat = "-28.47";
//    lon = "24.67";
//},
//"cod": 200,
//"main": {
//    "feels_like" = "288.35";
//    "grnd_level" = 894;
//    humidity = 37;
//    pressure = 1019;
//    "sea_level" = 1019;
//    temp = "289.68";
//    "temp_max" = "289.68";
//    "temp_min" = "289.68";
//},
//"id": 1021040,
//"name": Barkly West])
