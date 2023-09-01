//
//  WeatherViewController.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/30.
//

import UIKit
import CoreLocation

protocol WeatherViewProtocol {
    func fetchCurrentWeather()
    func presenterDidFetchCurrentWeather()
    func presenterDidFetchWeatherForecast()
}

class WeatherViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var weeatherImageView: UIImageView!
    
    @IBOutlet weak var currentLabel: UILabel!
    
    @IBOutlet weak var forecastView: UIView!
    
    @IBOutlet weak var minWeatherLabel: UILabel!
    
    @IBOutlet weak var currentWeatherLabel: UILabel!
    
    @IBOutlet weak var maxWeatherLabel: UILabel!
    
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
//        self.presenter?.viewDidLoad()
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
    
    func presenterDidFetchCurrentWeather() {}
    
    func presenterDidFetchWeatherForecast() {}
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
        
    }
}
