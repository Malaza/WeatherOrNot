//
//  WeatherPresenter.swift
//  CIViperGenerator
//
//  Created by Mthokozisi Malaza on 30.08.2023.
//  Copyright © 2023 Mthokozisi Malaza. All rights reserved.
//

import Foundation



class WeatherPresenter: WeatherPresenterProtocol {
    
    var view: WeatherViewProtocol?
    var router: WeatherRouterProtocol?
    var interactor: WeatherInteractorProtocol?

    init(interactor: WeatherInteractorProtocol, router: WeatherRouterProtocol, view: WeatherViewProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    //MARK: - Input
    func fetchCurrentWeather(request: CurrentWeatherRequest) {
        self.interactor?.fetchCurrentWeather(request: request)
    }
    
    func fetchWeatherForecast(request: WeatherForecastRequest) {
        self.interactor?.fetchWeatherForecast(request: request)
    }
    
    //MARK: - Output
    func interactorDidFetchCurrentWeather(with result: Result<CurrentWeatherResponse, Error>) {
        
        switch result {
            case .success(let weather):
            let model = self.transformToModelList(response: cocktails)
            self.view?.presenterDidFetchCurrentWeather()
            case .failure(let error):
            self.view?.presenterDidFetchCurrentWeather()
        }
    }
    
    func interactorDidFetchWeatherForecast(with result: Result<WeatherForecastResponse, Error>) {
        
    }
}
