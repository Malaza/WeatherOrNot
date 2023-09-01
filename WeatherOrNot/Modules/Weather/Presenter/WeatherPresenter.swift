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
            let model = self.transformToModel(response: weather)
            self.view?.presenterDidFetchCurrentWeather(with: .success(model))
            case .failure(let error):
            self.view?.presenterDidFetchCurrentWeather(with: .failure(error))
        }
    }
    
    func interactorDidFetchWeatherForecast(with result: Result<WeatherForecastResponse, Error>) {
        
        switch result {
            case .success(let forecast):
            let model = self.transformToModel(response: forecast)
            self.view?.presenterDidFetchWeatherForecast(with: .success(model))
            case .failure(let error):
            self.view?.presenterDidFetchWeatherForecast(with: .failure(error))
        }
    }
    
    
    //MARK: - Transform
    private func transformToModel(response: CurrentWeatherResponse) -> CurrentWeatherModel {
        
        let temp = Int(response.main?.temp ?? 0)
        let tempMin = Int(response.main?.temp_min ?? 0)
        let tempMax = Int(response.main?.temp_max ?? 0)
        
        let model = CurrentWeatherModel()
        model.temp = "\(temp)º"
        model.tempMin = "\(tempMin)º"
        model.tempMax = "\(tempMax)º"
        if let weather = response.weather?[0] {
            model.mainWeather = weather.main
            model.type = self.transformWeatherCode(code: weather.id ?? 0)
        }
        return model
    }
    
    private func transformWeatherCode(code: Int) -> CurrentWeatherTypes {
        
        //https://openweathermap.org/weather-conditions
        
        if code >= 500 && code < 600 { //Rain
            return .rainy
        }
        else if code > 800 && code < 900 { //Cloudy
            return .cloudy
        }
//        else if code == 800 { // Sunny
        return .sunny
    }
    
    private func transformToModel(response: WeatherForecastResponse) -> WeatherForecastModel {
        
        let model = WeatherForecastModel()
        return model
    }
}
