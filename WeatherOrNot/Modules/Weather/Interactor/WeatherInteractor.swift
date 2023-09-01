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
        
        self.service.serviceGet(lat: request.lat, long: request.long, with: request.path) { (data, error) in
            
            guard let data = data as? Data, error == nil else {
                self.presenter?.interactorDidFetchCurrentWeather(with: .failure(ServiceError.failed))
                print(ServiceError.failed.localizedDescription)
                return
            }
            do {
                let responseData =  try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                print(responseData)
                let weather = try JSONDecoder().decode(CurrentWeatherResponse.self, from: data)
                self.presenter?.interactorDidFetchCurrentWeather(with: .success(weather))
            }
            catch {
                self.presenter?.interactorDidFetchCurrentWeather(with: .failure(error))
                print(error.localizedDescription)
            }
        }
    }
        
    func fetchWeatherForecast(request: WeatherForecastRequest) {
        
        self.service.serviceGet(lat: request.lat, long: request.long, with: request.path) { response, error in
//            print(response)
        }
    }
    
}
