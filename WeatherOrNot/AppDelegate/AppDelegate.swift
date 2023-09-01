//
//  AppDelegate.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/30.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let weatherView = WeatherRouter.setupModule()
        let navigationController = UINavigationController(rootViewController: weatherView)
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

