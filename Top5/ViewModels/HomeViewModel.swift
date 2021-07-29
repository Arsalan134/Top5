//
//  HomeViewModel.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var recommendations: [Recommendation] = []
    
    @Published var errorMessage: String?
    
    @Published var isRefreshShowing: Bool = false
    
    enum RecommendationProgressState {
        case none, empty, loading, error
    }
    
    @Published var recommendationProgressState: RecommendationProgressState = .none
    
    func refreshButtonPressed() {
        recommendations.removeAll()
        downloadRecommendations()
    }
    
    @objc func downloadRecommendations() {
                
        recommendationProgressState = .loading
        
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        let url = "https://api.skypicker.com/flights?v=3&sort=popularity&asc=0&locale=en&daysInDestinationFrom&daysInDestinationTo&affilid=mainsolution1&children=0&infants=0&flyFrom=49.2-16.61-250km&to=anywhere&featureName=aggregateResults&dateFrom=\(day)%2F\(month)%2F\(year)&dateTo=\(day)%2F\(month)%2F\(year)&typeFlight=oneway&one_per_date=0&oneforcity=1&wait_for_refresh=0&adults=1&limit=5&partner=skypicker"
        
        NetworkManager.shared.dataRequest(with: url, objectType: RecRequest.self) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recommendations):
                    self?.recommendations = recommendations.data
                    self?.recommendationProgressState = self?.recommendations.isEmpty ?? true ? .empty : .none
                case .failure(let error):
                    print(error)
                }
                
                self?.isRefreshShowing = false
            }
        }
        
    }
    
}

