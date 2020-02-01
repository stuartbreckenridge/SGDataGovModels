//
//  LabelLocation.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation

// MARK: - LabelLocation

/// Type used to store GPS coordinates (latitude and longitude) of weather stations.
public struct LabelLocation: Codable {
    /// Latitude of the weather station.
    public let latitude: Double?
    
    /// Longitude of the weather station
    public let longitude: Double?

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }

    public init(latitude: Double?, longitude: Double?) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
