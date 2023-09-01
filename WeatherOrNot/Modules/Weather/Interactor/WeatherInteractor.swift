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
    
    func fetchCurrentWeather() {
        
        self.service.serviceGet(payload: <#T##AnyObject?#>, with: <#T##Path#>, completion: <#T##ServiceCompletion##ServiceCompletion##(Any?, ServiceError?) -> Void#>)
    }
        
    func fetchWeatherForecast() {}
    
}
