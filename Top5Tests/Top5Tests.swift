//
//  Top5Tests.swift
//  Top5Tests
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import XCTest
@testable import Top5

class Top5Tests: XCTestCase {

    var vm: HomeViewModel!
    
    override func setUp()  {
        vm = HomeViewModel()
    }
    
    func testRecommendationViewModel() {
        let recommendation = Recommendation(id: "Test Name", flyFrom: "", flyTo: "", cityFrom: "", cityCodeFrom: "", cityTo: "", cityCodeTo: "", countryFrom: nil, countryTo: nil, dTime: 0, dTimeUTC: 0, aTime: 0, aTimeUTC: 0, type_flights: [], nightsInDest: 0, quality: 0, popularity: 0, distance: 0, fly_duration: "", price: 0, routes: [], airlines: [], route: [], facilitated_booking_available: false, pnr_count: 0, has_airport_change: false, technical_stops: 0, virtual_interlining: false, mapIdfrom: "", mapIdto: "", hashtags: [], transfers: [], p1: 0, p2: 0, p3: 0)
        
        
        
        XCTAssertEqual(recommendation.id, "Test Name")
        
    }
}
