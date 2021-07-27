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
                    Text("Baku")
                        .foregroundColor(.gray)
                    
                    Text("GYD")
                        .font(.largeTitle)
                    
                }
                
                Spacer()
                
                Text("✈︎")
                    .foregroundColor(.gray)
                    .font(.largeTitle)
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Prague")
                        .foregroundColor(.gray)
                    
                    Text("PRG")
                        .font(.largeTitle)
                }
            }
            
            Spacer()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Date")
                        .foregroundColor(.gray)
                    
                    Text("Sep 13")
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Flight")
                        .foregroundColor(.gray)
                    
                    Text("J2 109")
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Departure")
                        .foregroundColor(.gray)
                    
                    Text("07:00")
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Arrival")
                        .foregroundColor(.gray)
                    
                    Text("09:30")
                }
                
                
                
            }
            
            Spacer()
            
        }
        
    }
    
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView(recommendation: Recommendation(name: "Test"))
    }
}
