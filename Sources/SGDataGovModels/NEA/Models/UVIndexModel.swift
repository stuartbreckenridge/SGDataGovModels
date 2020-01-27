//
//  UVIndexModel.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation

// MARK: - UVIndexModel
public struct UVIndexModel: Codable {
    public let items: [UVItem]?
    public let apiInfo: APIInfo?

    enum CodingKeys: String, CodingKey {
        case items = "items"
        case apiInfo = "api_info"
    }

    public init(items: [UVItem]?, apiInfo: APIInfo?) {
        self.items = items
        self.apiInfo = apiInfo
    }
}

// MARK: - Item
public struct UVItem: Codable {
    public let timestamp: String?
    public let updateTimestamp: String?
    public let readings: [IndexReading]?

    enum CodingKeys: String, CodingKey {
        case timestamp = "timestamp"
        case updateTimestamp = "update_timestamp"
        case readings = "index"
    }

    public init(timestamp: String?, updateTimestamp: String?, index: [IndexReading]?) {
        self.timestamp = timestamp
        self.updateTimestamp = updateTimestamp
        self.readings = index
    }
}

// MARK: - IndexReading
public struct IndexReading: Codable {
    public let value: Int?
    public let timestamp: String?

    enum CodingKeys: String, CodingKey {
        case value = "value"
        case timestamp = "timestamp"
    }

    public init(value: Int?, timestamp: String?) {
        self.value = value
        self.timestamp = timestamp
    }
}
