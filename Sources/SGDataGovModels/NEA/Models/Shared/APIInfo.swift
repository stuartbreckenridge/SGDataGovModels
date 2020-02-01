//
//  APIInfo.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation

// MARK: - APIInfo


/// Type used to store data related to the status of the API.
public struct APIInfo: Codable {
    
    /// The status of the API.
    public let status: String?

    enum CodingKeys: String, CodingKey {
        case status = "status"
    }

    public init(status: String?) {
        self.status = status
    }
}
