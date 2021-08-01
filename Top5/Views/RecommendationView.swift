//
//  RecommendationView.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import SwiftUI
import UIKit

struct RecommendationView: View {
    
    var recommendation: Recommendation
    
    @State var image = UIImage()
    
    var body: some View {
        VStack(spacing: 5) {
            
            Spacer()
            
            ZStack(alignment: .topTrailing) {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                Text("\(Int(recommendation.price ?? 0)) €")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(minWidth: 60)
                    .background(Color.green)
                
            }
            .cornerRadius(7)
            .padding(.top, 10)
            .shadow(radius: 10, x: 5, y: 10)
            
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(recommendation.cityFrom ?? "")
                        .foregroundColor(.gray)
                    
                    Text(recommendation.cityCodeFrom ?? "")
                        .font(.largeTitle)
                }
                
                Spacer()
                
                Text("✈︎")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text(recommendation.cityTo ?? "")
                        .foregroundColor(.gray)
                    
                    Text(recommendation.cityCodeTo ?? "")
                        .font(.largeTitle)
                }
            }
            
            Spacer()
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text("Date")
                        .foregroundColor(.gray)
                    
                    Text(unixDateToDateString(recommendation.dTimeUTC, withFormat: "MMM d"))
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Flight")
                        .foregroundColor(.gray)
                    
                    Text(recommendation.route?.count == 1 ? (recommendation.route?.first?.operating_carrier ?? "") + " " + ("\(recommendation.route?.first?.flight_no ?? 9999)" ) :  recommendation.route?.isEmpty ?? true ? "-" : "Multiple")
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Departure")
                        .foregroundColor(.gray)
                    
                    Text(unixDateToDateString(recommendation.dTimeUTC, withFormat: "HH:mm"))
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Arrival")
                        .foregroundColor(.gray)
                    
                    Text(unixDateToDateString(recommendation.aTimeUTC, withFormat: "HH:mm"))
                }
            }
            .padding(.bottom, 20)
            
            Spacer()
            
        }.onAppear {
            
            loadUIImage(from: "https://images.kiwi.com/photos/600x330/\(recommendation.mapIdto ?? "").jpg") { result in
                switch result {
                case .success(let image):
                    self.image = image
                case .failure(_):
                    print()
                }
            }
        }
    }
}

