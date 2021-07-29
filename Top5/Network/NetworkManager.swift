//
//  NetworkManager.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import Foundation

enum NetworkError: Error {
    case networkError(Error)
    case dataNotFound
    case jsonParsingError(Error)
    case invalidStatusCode(Int)
}

class NetworkManager {
    
    enum Enviroment {
        case test, production
    }
    
    private let enviroment: Enviroment = .production
    
    private let decoder = JSONDecoder()
    
    private init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    static var shared: NetworkManager = NetworkManager()
    
    private let testURL = "https://api.skypicker.com/"
    private let productionURL = "https://api.skypicker.com/"
    
    private let emptyParameters: [String: String]? = nil
    
    private func completeUrl(_ key: String) -> String {
        return (enviroment == .test ? testURL : productionURL) + key
    }
    
    
    //Result enum to show success or failure
    enum Result<T> {
        case success(T)
        case failure(NetworkError)
    }
    
    // DataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T>) -> Void) {
        
        guard let url = URL(string: url) else {
            return
        }
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        let request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                completion(.failure(.networkError(error!)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.dataNotFound))
                return
            }
            
            do {
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(.success(decodedObject))
            } catch let error {
                completion(.failure(.jsonParsingError(error as! DecodingError)))
            }
        })
        
        task.resume()
        
    }
}


