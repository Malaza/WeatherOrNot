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
    
    var presenter: WeatherPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
