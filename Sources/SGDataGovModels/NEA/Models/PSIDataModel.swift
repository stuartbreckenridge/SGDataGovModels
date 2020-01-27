//
//  File.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

// MARK: - PSIDataModel
public struct PSIDataModel: Codable {
    public let regionMetadata: [RegionMetadatum]?
    public let items: [PSIItem]?
    public let apiInfo: APIInfo?

    enum CodingKeys: String, CodingKey {
        case regionMetadata = "region_metadata"
        case items = "items"
        case apiInfo = "api_info"
    }

    public init(regionMetadata: [RegionMetadatum]?, items: [PSIItem]?, apiInfo: APIInfo?) {
        self.regionMetadata = regionMetadata
        self.items = items
        self.apiInfo = apiInfo
    }
}

// MARK: - Item
public struct PSIItem: Codable {
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
    public let o3SubIndex: CoSubIndex?
    public let pm10TwentyFourHourly: CoSubIndex?
    public let pm10SubIndex: CoSubIndex?
    public let coSubIndex: CoSubIndex?
    public let pm25TwentyFourHourly: CoSubIndex?
    public let so2SubIndex: CoSubIndex?
    public let coEightHourMax: CoEightHourMax?
    public let no2OneHourMax: CoSubIndex?
    public let so2TwentyFourHourly: CoSubIndex?
    public let pm25SubIndex: CoSubIndex?
    public let psiTwentyFourHourly: CoSubIndex?
    public let o3EightHourMax: CoSubIndex?

    enum CodingKeys: String, CodingKey {
        case o3SubIndex = "o3_sub_index"
        case pm10TwentyFourHourly = "pm10_twenty_four_hourly"
        case pm10SubIndex = "pm10_sub_index"
        case coSubIndex = "co_sub_index"
        case pm25TwentyFourHourly = "pm25_twenty_four_hourly"
        case so2SubIndex = "so2_sub_index"
        case coEightHourMax = "co_eight_hour_max"
        case no2OneHourMax = "no2_one_hour_max"
        case so2TwentyFourHourly = "so2_twenty_four_hourly"
        case pm25SubIndex = "pm25_sub_index"
        case psiTwentyFourHourly = "psi_twenty_four_hourly"
        case o3EightHourMax = "o3_eight_hour_max"
    }

    public init(o3SubIndex: CoSubIndex?, pm10TwentyFourHourly: CoSubIndex?, pm10SubIndex: CoSubIndex?, coSubIndex: CoSubIndex?, pm25TwentyFourHourly: CoSubIndex?, so2SubIndex: CoSubIndex?, coEightHourMax: CoEightHourMax?, no2OneHourMax: CoSubIndex?, so2TwentyFourHourly: CoSubIndex?, pm25SubIndex: CoSubIndex?, psiTwentyFourHourly: CoSubIndex?, o3EightHourMax: CoSubIndex?) {
        self.o3SubIndex = o3SubIndex
        self.pm10TwentyFourHourly = pm10TwentyFourHourly
        self.pm10SubIndex = pm10SubIndex
        self.coSubIndex = coSubIndex
        self.pm25TwentyFourHourly = pm25TwentyFourHourly
        self.so2SubIndex = so2SubIndex
        self.coEightHourMax = coEightHourMax
        self.no2OneHourMax = no2OneHourMax
        self.so2TwentyFourHourly = so2TwentyFourHourly
        self.pm25SubIndex = pm25SubIndex
        self.psiTwentyFourHourly = psiTwentyFourHourly
        self.o3EightHourMax = o3EightHourMax
    }
}

// MARK: - CoEightHourMax
public struct CoEightHourMax: Codable {
    public let west: Double?
    public let national: Double?
    public let east: Double?
    public let central: Double?
    public let south: Double?
    public let north: Double?

    enum CodingKeys: String, CodingKey {
        case west = "west"
        case national = "national"
        case east = "east"
        case central = "central"
        case south = "south"
        case north = "north"
    }

    public init(west: Double?, national: Double?, east: Double?, central: Double?, south: Double?, north: Double?) {
        self.west = west
        self.national = national
        self.east = east
        self.central = central
        self.south = south
        self.north = north
    }
}

// MARK: - CoSubIndex
public struct CoSubIndex: Codable {
    public let west: Int?
    public let national: Int?
    public let east: Int?
    public let central: Int?
    public let south: Int?
    public let north: Int?

    enum CodingKeys: String, CodingKey {
        case west = "west"
        case national = "national"
        case east = "east"
        case central = "central"
        case south = "south"
        case north = "north"
    }

    public init(west: Int?, national: Int?, east: Int?, central: Int?, south: Int?, north: Int?) {
        self.west = west
        self.national = national
        self.east = east
        self.central = central
        self.south = south
        self.north = north
    }
}
