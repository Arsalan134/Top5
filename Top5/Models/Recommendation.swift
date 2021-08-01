//
//  Recommendation.swift
//  Top5
//
//  Created by Arsalan Iravani on 27.07.2021.
//

import Foundation

struct Route: Decodable {
    var id: String?
    var combination_id: String?
    var flyFrom: String?
    var flyTo: String?
    var cityFrom: String?
    var cityCodeFrom: String?
    var cityTo: String?
    var cityCodeTo: String?
    var dTime: Double?
    var dTimeUTC: Double?
    var aTime: Double?
    var aTimeUTC: Double?
    var airline: String?
    var flight_no: Int?
    var operating_carrier: String?
    var operating_flight_no: String?
    var fare_basis: String?
    var fare_category: String?
    var fare_classes: String?
    var `return`: Double?
    var latFrom: Double?
    var lngFrom: Double?
    var latTo: Double?
    var lngTo: Double?
    var mapIdfrom: String?
    var mapIdto: String?
    var bags_recheck_required: Bool?
    var guarantee: Bool?
    var last_seen: Double?
    var refresh_timestamp: Double?
    var vehicle_type: String?
    var original_return: Int?
    var source: String?
    var found_on: String?
    var price: Double?
}

struct CountryFromTo: Decodable {
    var code: String?
    var name: String?
}

struct Recommendation: Decodable, Identifiable {
    var id: String
    var flyFrom: String?
    var flyTo: String?
    var cityFrom: String?
    var cityCodeFrom: String?
    var cityTo: String?
    var cityCodeTo: String?
    
    var countryFrom: CountryFromTo?
    var countryTo: CountryFromTo?
    
    var dTime: Int?
    var dTimeUTC: Int?
    var aTime: Int?
    var aTimeUTC: Int?
    var type_flights: [String?]?
    var nightsInDest: Int?
    var quality: Double?
    var popularity: Double?
    var distance: Double?
    
    var fly_duration: String?
    
    var price: Double?

    var routes: [[String]]?
    
    var airlines: [String]?
    
    var route: [Route]?
    
    var facilitated_booking_available: Bool?
    var pnr_count: Int?
    var has_airport_change: Bool?
    var technical_stops: Int?
    var virtual_interlining: Bool?
    var mapIdfrom: String?
    var mapIdto: String?
    var hashtags: [String]?
    var transfers: [String]?
    var p1: Int?
    var p2: Int?
    var p3: Int?
}
