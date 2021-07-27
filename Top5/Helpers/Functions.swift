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
