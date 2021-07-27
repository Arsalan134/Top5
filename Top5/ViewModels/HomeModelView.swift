//
//  HomeModelView.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var recommendations: [Recommendation] = [
        Recommendation(name: "salam"),
        Recommendation(name: "necesen"),
        Recommendation(name: "yaxshiyam"),
        Recommendation(name: "salam"),
        Recommendation(name: "necesen"),
    ]
    
    
    @Published var errorMessage: String?
    
    @Published var isRefreshShowing: Bool = false
    
    fileprivate enum RecommendationProgressState {
        case none, empty, loading, error
    }
    
    @Published fileprivate var recommendationProgressState: RecommendationProgressState = .none
        
    @objc func downloadRecommendations() {
        recommendationProgressState = .loading
        
        NetworkManager.shared.getRecommendations() { result in
            switch result {
            case .success(let recommendations):
                self.recommendations = recommendations
                self.recommendationProgressState = self.recommendations.isEmpty ? .empty : .none
            case .failure(let error):
                self.recommendationProgressState = .error
                print(error.localizedDescription)
            }
            
            self.isRefreshShowing = false
        }
    }
    
    init() {
        
    }
    
}
