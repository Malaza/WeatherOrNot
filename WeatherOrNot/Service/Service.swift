//
//  Service.swift
//  WeatherOrNot
//
//  Created by Mthokozisi Malaza on 2023/08/31.
//

import Foundation

public enum ServiceError: Error {
    case failed
}

class Service: ServiceProtocol {
    
    func serviceGet(lat: Double, long: Double, with path: String, completion: @escaping ServiceCompletion) {
        
        let request = self.getURLRequest(lat: lat, long: long, path: path, apiKey: Constants.apiKey)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            DispatchQueue.main.async() {
                if (error != nil) {
                    completion(nil, .failed)
                }
                else {
                    completion(data, nil)
                }
            }
        })
        dataTask.resume()
    }
    
    //MARK: - URL
    private func getURLRequest(lat: Double, long: Double, path: String, apiKey: String) -> NSMutableURLRequest {
        return NSMutableURLRequest(url: NSURL(string: "https://api.openweathermap.org/data/2.5/\(path)?lat=\(lat)&lon=\(long)&cnt=5&appid=\(apiKey)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
    }
}
