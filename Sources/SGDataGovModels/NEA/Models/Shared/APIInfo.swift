//
//  APIInfo.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation

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
