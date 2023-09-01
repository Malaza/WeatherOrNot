//
//  WeatherInteractorProtocol.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/30.
//

import Foundation

protocol WeatherInteractorProtocol {
    
    var presenter: WeatherPresenterProtocol? { get set }
    
    func fetchCurrentWeather(request: CurrentWeatherRequest)
    func fetchWeatherForecast(request: WeatherForecastRequest)
}
