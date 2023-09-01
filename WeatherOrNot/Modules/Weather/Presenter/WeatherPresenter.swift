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
    
    
    
    func requestUserLocation() {
        
    }
    
    func fetchCurrentWeather(completion: @escaping ServiceCompletion) {
        self.interactor?.fetchCurrentWeather()
    }
    
    func fetchWeatherForecast(completion: @escaping ServiceCompletion) {
        self.interactor?.fetchWeatherForecast()
    }
}
