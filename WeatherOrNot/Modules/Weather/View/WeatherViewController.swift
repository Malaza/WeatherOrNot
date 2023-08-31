//
//  WeatherViewController.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/30.
//

import UIKit

protocol WeatherViewControllerProtocol {

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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
