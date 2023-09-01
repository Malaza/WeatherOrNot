//
//  UIViewController.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/09/01.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showErrorMessage(message:String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "WeatherOrNot", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
