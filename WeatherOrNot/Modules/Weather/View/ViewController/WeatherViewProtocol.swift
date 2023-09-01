//
//  WeatherViewProtocol.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/09/01.
//

import Foundation

protocol WeatherViewProtocol {
    func fetchCurrentWeather()
    func fetchWeatherForecast()
    func presenterDidFetchCurrentWeather(with result: Result<CurrentWeatherModel, Error>)
    func presenterDidFetchWeatherForecast(with result: Result<[ForecastModel], Error>)
}
