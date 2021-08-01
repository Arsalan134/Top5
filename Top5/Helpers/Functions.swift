//
//  Functions.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import Foundation
import UIKit


func loadUIImage(from urlString: String?, completed: @escaping (Result<UIImage, Error>) -> Void) {
    guard let url = URL(string: urlString ?? "") else {
        return
    }
    
    if let data = try? Data(contentsOf: url) {
        if let image = UIImage(data: data) {
            DispatchQueue.main.async {
                completed(.success(image))
            }
        }
    }
}

func unixDateToDateString(_ dateInSeconds: Int?, withFormat format: String) -> String {
    
    guard dateInSeconds != nil else {
        return ""
    }
    
    let date = Date(timeIntervalSince1970: TimeInterval(dateInSeconds ?? 0))
    
    let dateFormatter = DateFormatter()
    dateFormatter.setLocalizedDateFormatFromTemplate(format)
    dateFormatter.timeZone = .current
    
    let localDate = dateFormatter.string(from: date)
    
    return localDate
}

func flightNumbersStringFromRoute(_ array: [Route]?) -> String {
    return (array ?? []).reduce("") { result, route in
        if route.flight_no != nil {
            return result + "\(route.flight_no ?? 0)"
        } else {
            return result
        }
    }
}
