//
//  RegionalMatadatum.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation

// MARK: - RegionMetadatum


/// Type used to store name and location of weather station.
public struct RegionMetadatum: Codable {
    
    /// The name of the weather station.
    public let name: String?
    
    /// The location of the weather station.
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
