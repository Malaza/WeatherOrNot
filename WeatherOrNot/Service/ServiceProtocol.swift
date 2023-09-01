//
//  ServiceProtocol.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/31.
//

import Foundation

typealias ServiceCompletion = (Any?, ServiceError?) -> Void

protocol ServiceProtocol {
    func serviceGet(lat: Double, long: Double, with path: String, completion: @escaping ServiceCompletion)
}
