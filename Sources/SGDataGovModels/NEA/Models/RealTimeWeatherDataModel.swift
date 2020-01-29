//
//  RealTimeWeatherDataModel.swift
//  
//
//  Created by Stuart Breckenridge on 29/01/2020.
//

import Foundation


// MARK: - RealTimeWeatherDataModel
public struct RealTimeWeatherDataModel: Codable {
    public let apiInfo: APIInfo?
    public let metadata: Metadata?
    public let items: [RealTimeWeatherItem]?

    enum CodingKeys: String, CodingKey {
        case apiInfo = "api_info"
        case metadata = "metadata"
        case items = "items"
    }

    public init(apiInfo: APIInfo?, metadata: Metadata?, items: [RealTimeWeatherItem]?) {
        self.apiInfo = apiInfo
        self.metadata = metadata
        self.items = items
    }
}

// MARK: - RealTimeWeatherItem
public struct RealTimeWeatherItem: Codable {
    public let timestamp: String?
    public let readings: [Reading]?

    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case readings = "readings"
    }

    public init(timestamp: String?, readings: [Reading]?) {
        self.timestamp = timestamp
        self.readings = readings
    }
}

// MARK: - Reading
public struct Reading: Codable {
    public let stationid: String?
    public let value: Double?

    enum CodingKeys: String, CodingKey {
        case stationid = "station_id"
        case value = "value"
    }

    public init(stationid: String?, value: Double?) {
        self.stationid = stationid
        self.value = value
    }
}

// MARK: - Metadata
public struct Metadata: Codable {
    public let stations: [Station]?
    public let readingType: String?
    public let readingUnit: String?

    enum CodingKeys: String, CodingKey {
        case stations = "stations"
        case readingType = "reading_type"
        case readingUnit = "reading_unit"
    }

    public init(stations: [Station]?, readingType: String?, readingUnit: String?) {
        self.stations = stations
        self.readingType = readingType
        self.readingUnit = readingUnit
    }
}

// MARK: - Station
public struct Station: Codable {
    public let id: String?
    public let deviceid: String?
    public let name: String?
    public let location: Location?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case deviceid = "device_id"
        case name = "name"
        case location = "location"
    }

    public init(id: String?, deviceid: String?, name: String?, location: Location?) {
        self.id = id
        self.deviceid = deviceid
        self.name = name
        self.location = location
    }
}

// MARK: - Location
public struct Location: Codable {
    public let longitude: Double?
    public let latitude: Double?

    enum CodingKeys: String, CodingKey {
        case longitude = "longitude"
        case latitude = "latitude"
    }

    public init(longitude: Double?, latitude: Double?) {
        self.longitude = longitude
        self.latitude = latitude
    }
}
