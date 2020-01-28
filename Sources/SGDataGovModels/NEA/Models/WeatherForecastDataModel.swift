//
//  WeatherForecastDataModel.swift
//  
//
//  Created by Stuart Breckenridge on 28/01/2020.
//

import Foundation

// MARK: - ForecastDataModel
public struct ForecastDataModel: Codable {
    public let apiInfo: APIInfo?
    public let areaMetadata: [AreaMetadatum]?
    public let items: [ForecastItem]?

    enum CodingKeys: String, CodingKey {
        case apiInfo = "api_info"
        case areaMetadata = "area_metadata"
        case items = "items"
    }

    public init(apiInfo: APIInfo?, areaMetadata: [AreaMetadatum]?, items: [ForecastItem]?) {
        self.apiInfo = apiInfo
        self.areaMetadata = areaMetadata
        self.items = items
    }
}

// MARK: - AreaMetadatum
public struct AreaMetadatum: Codable {
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

// MARK: - ForecastItem
public struct ForecastItem: Codable {
    public let updateTimestamp: String?
    public let timestamp: String?
    public let validPeriod: ValidPeriod?
    public let forecasts: [Forecast]?

    enum CodingKeys: String, CodingKey {
        case updateTimestamp = "update_timestamp"
        case timestamp = "timestamp"
        case validPeriod = "valid_period"
        case forecasts = "forecasts"
    }

    public init(updateTimestamp: String?, timestamp: String?, validPeriod: ValidPeriod?, forecasts: [Forecast]?) {
        self.updateTimestamp = updateTimestamp
        self.timestamp = timestamp
        self.validPeriod = validPeriod
        self.forecasts = forecasts
    }
}

// MARK: - Forecast
public struct Forecast: Codable {
    public let area: String?
    public let forecast: String?

    enum CodingKeys: String, CodingKey {
        case area = "area"
        case forecast = "forecast"
    }

    public init(area: String?, forecast: String?) {
        self.area = area
        self.forecast = forecast
    }
}

// MARK: - ValidPeriod
public struct ValidPeriod: Codable {
    public let start: String?
    public let end: String?

    enum CodingKeys: String, CodingKey {
        case start = "start"
        case end = "end"
    }

    public init(start: String?, end: String?) {
        self.start = start
        self.end = end
    }
}
