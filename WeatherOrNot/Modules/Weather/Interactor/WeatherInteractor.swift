//
//  WeatherInteractor.swift
//  CIViperGenerator
//
//  Created by Mthokozisi Malaza on 30.08.2023.
//  Copyright © 2023 Mthokozisi Malaza. All rights reserved.
//

import Foundation


class WeatherInteractor: WeatherInteractorProtocol {
    
    let service = Service()
    var presenter: WeatherPresenterProtocol?
    
    func fetchCurrentWeather(request: CurrentWeatherRequest) {
        
        self.service.serviceGet(lat: request.lat ?? 0, long: request.long ?? 0, with: request.path ?? "") { (data, error) in
            
            guard let data = data as? Data, error == nil else {
                self.presenter?.interactorDidFetchCurrentWeather(with: .failure(ServiceError.failed))
                return
            }
            do {
                let weather = try JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
                self.presenter?.interactorDidFetchCurrentWeather(with: .success(weather))
            }
            catch {
                self.presenter?.interactorDidFetchCurrentWeather(with: .failure(error))
            }
        }
    }
        
    func fetchWeatherForecast(request: WeatherForecastRequest) {
        
        self.service.serviceGet(lat: request.lat ?? 0, long: request.long ?? 0, with: request.path ?? "") { (data, error) in
            
            guard let data = data as? Data, error == nil else {
                self.presenter?.interactorDidFetchWeatherForecast(with: .failure(ServiceError.failed))
                return
            }
            do {
                let forecast = try JSONDecoder().decode(WeatherForecastResponse.self, from: data)
                self.presenter?.interactorDidFetchWeatherForecast(with: .success(forecast))
            }
            catch {
                self.presenter?.interactorDidFetchWeatherForecast(with: .failure(error))
            }
        }
    }
    
}
