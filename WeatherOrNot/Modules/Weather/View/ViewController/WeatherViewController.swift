//
//  WeatherViewController.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/30.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var currentWeatherView: CurrentWeatherView!
    
    @IBOutlet weak var weatherForecastView: WeatherForecastView!
    
    
    //MARK: - Variables
    var presenter: WeatherPresenterProtocol?
    var locationManager: CLLocationManager?

    
    //MARK: - Setup
    private func setupLocationManager() {
        self.locationManager = CLLocationManager()
        self.locationManager?.delegate = self
        self.locationManager?.requestAlwaysAuthorization()
    }
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLocationManager()
    }
    
    
    
}


extension WeatherViewController: WeatherViewProtocol {
    
    func fetchCurrentWeather() {
        if self.locationManager?.authorizationStatus == .authorizedAlways {
            if let coordinate = self.locationManager?.location?.coordinate {
                let request = CurrentWeatherRequest(lat: coordinate.latitude,
                                                    long: coordinate.longitude,
                                                    path: Constants.current)
                self.presenter?.fetchCurrentWeather(request: request)
            }
        }
    }
    
    func fetchWeatherForecast() {
        if self.locationManager?.authorizationStatus == .authorizedAlways {
            if let coordinate = self.locationManager?.location?.coordinate {
                let request = WeatherForecastRequest(lat: coordinate.latitude,
                                                    long: coordinate.longitude,
                                                    path: Constants.forecast)
                self.presenter?.fetchWeatherForecast(request: request)
            }
        }
    }
    
    func presenterDidFetchCurrentWeather(with result: Result<CurrentWeatherModel, Error>) {
        switch result {
        case .success(let model):
            self.currentWeatherView.configureCurrentView(model: model)
            self.fetchWeatherForecast()
        case .failure(let error):
            self.showErrorMessage(message: error.localizedDescription)
        }
    }
    
    func presenterDidFetchWeatherForecast(with result: Result<WeatherForecastModel, Error>) {
        switch result {
        case .success(let model):
            self.weatherForecastView.configureForecastView(model: model)
        case .failure(let error):
            self.showErrorMessage(message: error.localizedDescription)
        }
    }
}


extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch self.locationManager?.authorizationStatus {
        case .authorizedWhenInUse:
            self.fetchCurrentWeather()
            break
        case .authorizedAlways:
            self.fetchCurrentWeather()
            break
        case .denied:
            //Show message
            break
        case .notDetermined:
            self.locationManager?.requestWhenInUseAuthorization()
           break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.showErrorMessage(message: "We need location access in order to improve your app experience")
    }
}
