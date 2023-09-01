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
    
//    var completion: ServiceCompletion?
    
    
    func serviceGet(payload: AnyObject?, with path: Path, completion: @escaping ServiceCompletion) {
        
//        self.completion = completion
        let apiKey = self.getAPIKey()
        let request = self.getURL(lat: "18.0212", long: "-39.0022", path: path.rawValue, apiKey: apiKey)
        
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
    
    //MARK: - Authorization
    private func getAPIKey() -> String {
        return "1c8c9610e4c998aa77223d580d9717c8"
    }
    
    private func getURL(lat: String, long: String, path: String, apiKey: String) -> NSMutableURLRequest {
        return NSMutableURLRequest(url: NSURL(string: "https://api.openweathermap.org/data/2.5/\(path)?lat=\(lat)&lon=\(long)&appid=\(apiKey)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
    }
}
