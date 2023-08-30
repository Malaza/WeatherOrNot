//
//  WeatherPresenter.swift
//  CIViperGenerator
//
//  Created by Mthokozisi Malaza on 30.08.2023.
//  Copyright © 2023 Mthokozisi Malaza. All rights reserved.
//

import Foundation

protocol WeatherPresenterInterface: class {

}

class WeatherPresenter {

    unowned var view: WeatherViewControllerInterface
    let router: WeatherRouterInterface?
    let interactor: WeatherInteractorInterface?

    init(interactor: WeatherInteractorInterface, router: WeatherRouterInterface, view: WeatherViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension WeatherPresenter: WeatherPresenterInterface {

}
