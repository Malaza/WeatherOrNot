//
//  WeatherInteractorProtocol.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/30.
//

import Foundation

protocol WeatherInteractorProtocol {
    
    var presenter: WeatherInteractorProtocol? { get set }
    
    func fetchCurrentWeather()
    func fetchWeatherForecast()
}
