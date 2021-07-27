//
//  NetworkManager.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import Foundation

enum NetworkError: Error {
    case badURL
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
    
    
    func getRecommendations(completed: @escaping (Result<[Recommendation], NetworkError>) -> Void) {
        guard let url = URL(string: completeUrl("flights")) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            
            print(String(data: data, encoding: .utf8)!)
        }

        task.resume()
        
        //        AF.request(completeUrl("cities"), method: .get, parameters: emptyParameters, encoder: JSONParameterEncoder.default, headers: ["Content-Type": "application/json", "Authorization": "Bearer \(User.getToken() ?? "")"]).responseJSON { response in
        
        
        //            guard let data = response.data, let statusCode = response.response?.statusCode else {
        //                return
        //            }
        
        //            switch statusCode {
        //            case 200:
        //                do {
        //                    let json = try JSON(data: data)
        //                    print(json)
        //                    if let userDictionary = json["results"].arrayObject {
        //                        let jsonData = try JSONSerialization.data(withJSONObject: userDictionary, options: [])
        //                        let cities: [City] = try self.decoder.decode([City].self, from: jsonData)
        //                        completed(.success(cities))
        //
        //                    } else {
        //                        print("Cannot convert to dictionary")
        //                    }
        //                } catch {
        //                    print(error.localizedDescription)
        //                }
        //            default:
        //                let errors = self.convertErrorMessage(data: response.data)
        //                completed(.failure(errors))
        //            }
        
        
    }
}


