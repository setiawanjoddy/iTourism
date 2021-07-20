//
//  TourismData.swift
//  iTourism
//
//  Created by Setiawan Joddy on 18/07/21.
//

import Foundation

struct TourismData: Codable {
    let places: [Place]
}

struct Place: Codable {
    let name: String
    let description: String
    let address: String
    let longitude: Double
    let latitude: Double
    let image: String
}
