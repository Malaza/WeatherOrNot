//
//  WeatherRouter.swift
//  CIViperGenerator
//
//  Created by Mthokozisi Malaza on 30.08.2023.
//  Copyright © 2023 Mthokozisi Malaza. All rights reserved.
//

import Foundation
import UIKit



class WeatherRouter: WeatherRouterProtocol {

    var presenter: WeatherPresenterProtocol?

    static func setupModule() -> WeatherViewController {
        let vc = WeatherViewController()
        let interactor = WeatherInteractor()
        let router = WeatherRouter()
        let presenter = WeatherPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}
