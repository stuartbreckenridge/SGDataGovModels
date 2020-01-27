//
//  RegionalMatadatum.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation

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
