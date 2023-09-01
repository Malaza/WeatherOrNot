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
    
    //MARK: - Input
    func viewDidLoad()
    func requestUserLocation()
    func fetchCurrentWeather(request: CurrentWeatherRequest)
    func fetchWeatherForecast(request: WeatherForecastRequest)
    
    //MARK: - Output
    func interactorDidFetchCurrentWeather(with result: Result<CurrentWeatherResponse, Error>)
    func interactorDidFetchWeatherForecast(with result: Result<WeatherForecastResponse, Error>)
}
