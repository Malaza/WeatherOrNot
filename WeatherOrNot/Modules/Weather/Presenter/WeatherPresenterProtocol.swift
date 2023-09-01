//
//  WeatherPresenterProtocol.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/30.
//

import Foundation

protocol WeatherPresenterProtocol {
    
    var view: WeatherViewProtocol? { get set }
    var router: WeatherRouterProtocol? { get set }
    var interactor: WeatherInteractorProtocol? { get set }
    
    func requestUserLocation()
    func fetchCurrentWeather(completion: @escaping ServiceCompletion)
    func fetchWeatherForecast(completion: @escaping ServiceCompletion)
}
