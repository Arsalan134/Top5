//
//  RecommendationView.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import SwiftUI

struct RecommendationView: View {
    
    var recommendation: Recommendation
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("london")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(7)
            
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
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Date")
                        .foregroundColor(.gray)
                    
                    Text(unixDateToDateString(recommendation.dTimeUTC))
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Flight")
                        .foregroundColor(.gray)
                    
                    Text(flightNumbersStringFromRoute(recommendation.route))
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Departure")
                        .foregroundColor(.gray)
                    
                    Text(unixDateToTimeString(recommendation.dTimeUTC))
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Arrival")
                        .foregroundColor(.gray)
                    
                    Text(unixDateToTimeString(recommendation.aTimeUTC))
                }
                
                
                
            }
            
            Spacer()
            
        }
        
    }
    
}

//struct RecommendationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendationView(recommendation: Recommendation(name: "Test"))
//    }
//}
