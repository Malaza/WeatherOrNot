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
    @IBOutlet weak var weeatherImageView: UIImageView!
    
    @IBOutlet weak var currentLabel: UILabel! {
        didSet {
            currentLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var forecastView: UIView!
    
    @IBOutlet weak var minWeatherLabel: UILabel! {
        didSet {
            minWeatherLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var currentWeatherLabel: UILabel! {
        didSet {
            currentWeatherLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var maxWeatherLabel: UILabel! {
        didSet {
            maxWeatherLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var tuesdayLabel: UILabel!
    
    @IBOutlet weak var tuesdayImageView: UIImageView!
    
    @IBOutlet weak var tuesdayWeatherLabel: UILabel!
    
    @IBOutlet weak var wednesdayLabel: UILabel!
    
    @IBOutlet weak var wednesdayImageView: UIImageView!
    
    @IBOutlet weak var wednesdayWeatherLabel: UILabel!
    
    @IBOutlet weak var thursdayLabel: UILabel!
    
    @IBOutlet weak var thursdayImageView: UIImageView!
    
    @IBOutlet weak var thursdayWeatherLabel: UILabel!
    
    @IBOutlet weak var fridayLabel: UILabel!
    
    @IBOutlet weak var fridayImageView: UIImageView!
    
    @IBOutlet weak var fridayWeatherLabel: UILabel!
    
    @IBOutlet weak var saturdayLabel: UILabel!
    
    @IBOutlet weak var saturdayImageView: UIImageView!
    
    @IBOutlet weak var saturdayWeatherLabel: UILabel!
    
    
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
    
    func configureCurrentView(model: CurrentWeatherModel) {
        self.currentLabel.attributedText = self.attributedStringForTitle(title: model.temp, subTitle: model.mainWeather.uppercased(), large: true)
        self.minWeatherLabel.attributedText = self.attributedStringForTitle(title: model.tempMin, subTitle: "Min", large: false)
        self.currentWeatherLabel.attributedText = self.attributedStringForTitle(title:model.tempMax, subTitle: "Current", large: false)
        self.maxWeatherLabel.attributedText = self.attributedStringForTitle(title: model.temp, subTitle: "Max", large: false)
        self.weeatherImageView.image = UIImage(named: model.type.rawValue)
    }
    
    func configureForecastView(model: WeatherForecastModel) {
        
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
            self.configureCurrentView(model: model)
            self.fetchWeatherForecast()
        case .failure(let error):
            self.showErrorMessage(message: error.localizedDescription)
        }
    }
    
    func presenterDidFetchWeatherForecast(with result: Result<WeatherForecastModel, Error>) {
        switch result {
        case .success(let model):
            self.configureForecastView(model: model)
        case .failure(let error):
            self.showErrorMessage(message: error.localizedDescription)
        }
    }
}


extension WeatherViewController: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        switch self.locationManager?.authorizationStatus {
        case .authorizedWhenInUse:
            self.fetchWeatherForecast()
            break
        case .authorizedAlways:
            self.fetchWeatherForecast()
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
        
    }
}
