//
//  WeatherPresenter.swift
//  CIViperGenerator
//
//  Created by Mthokozisi Malaza on 30.08.2023.
//  Copyright © 2023 Mthokozisi Malaza. All rights reserved.
//

import Foundation



class WeatherPresenter: WeatherPresenterProtocol {

    var view: WeatherViewControllerProtocol?
    var router: WeatherRouterProtocol?
    let interactor: WeatherInteractorProtocol?

    init(interactor: WeatherInteractorProtocol, router: WeatherRouterProtocol, view: WeatherViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
