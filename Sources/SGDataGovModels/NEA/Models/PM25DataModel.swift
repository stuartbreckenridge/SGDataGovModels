//
//  PM25DataModel.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation

// MARK: - PM25DataModel
public struct PM25DataModel: Codable {
    public let regionMetadata: [RegionMetadatum]?
    public let items: [Item]?
    public let apiInfo: APIInfo?

    enum CodingKeys: String, CodingKey {
        case regionMetadata = "region_metadata"
        case items = "items"
        case apiInfo = "api_info"
    }

    public init(regionMetadata: [RegionMetadatum]?, items: [Item]?, apiInfo: APIInfo?) {
        self.regionMetadata = regionMetadata
        self.items = items
        self.apiInfo = apiInfo
    }
}

// MARK: - APIInfo
public struct APIInfo: Codable {
    public let status: String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
    }

    public init(status: String?) {
        self.status = status
    }
}

// MARK: - Item
public struct Item: Codable {
    public let timestamp: String?
    public let updateTimestamp: String?
    public let readings: Readings?

    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case updateTimestamp = "update_timestamp"
        case readings = "readings"
    }

    public init(timestamp: String?, updateTimestamp: String?, readings: Readings?) {
        self.timestamp = timestamp
        self.updateTimestamp = updateTimestamp
        self.readings = readings
    }
}

// MARK: - Readings
public struct Readings: Codable {
    public let pm25OneHourly: Pm25OneHourly?

    enum CodingKeys: String, CodingKey {
        case pm25OneHourly = "pm25_one_hourly"
    }

    public init(pm25OneHourly: Pm25OneHourly?) {
        self.pm25OneHourly = pm25OneHourly
    }
}

// MARK: - Pm25OneHourly
public struct Pm25OneHourly: Codable {
    public let west: Int?
    public let east: Int?
    public let central: Int?
    public let south: Int?
    public let north: Int?

    enum CodingKeys: String, CodingKey {
        case west = "west"
        case east = "east"
        case central = "central"
        case south = "south"
        case north = "north"
    }

    public init(west: Int?, east: Int?, central: Int?, south: Int?, north: Int?) {
        self.west = west
        self.east = east
        self.central = central
        self.south = south
        self.north = north
    }
}

// MARK: - RegionMetadatum
public struct RegionMetadatum: Codable {
    public let name: String?
    public let labelLocation: LabelLocation?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case labelLocation = "label_location"
    }

    public init(name: String?, labelLocation: LabelLocation?) {
        self.name = name
        self.labelLocation = labelLocation
    }
}

// MARK: - LabelLocation
public struct LabelLocation: Codable {
    public let latitude: Double?
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
