//
//  WeatherInteractor.swift
//  CIViperGenerator
//
//  Created by Mthokozisi Malaza on 30.08.2023.
//  Copyright © 2023 Mthokozisi Malaza. All rights reserved.
//

import Foundation

protocol WeatherInteractorInterface: class {

}

class WeatherInteractor {
    weak var presenter: WeatherPresenterInterface?
}

extension WeatherInteractor: WeatherInteractorInterface {

}
