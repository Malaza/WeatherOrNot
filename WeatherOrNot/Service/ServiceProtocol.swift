//
//  ServiceProtocol.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/31.
//

import Foundation

typealias ServiceCompletion = (Any?, ServiceError?) -> Void

protocol ServiceProtocol {
    func serviceGet(payload: AnyObject?, with path: Path, completion: @escaping ServiceCompletion)
}
