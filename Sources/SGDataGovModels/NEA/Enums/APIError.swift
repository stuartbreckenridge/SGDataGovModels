//
//  APIError.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation


/// The `APIError` enum is used when there is an error in the API response.
public enum APIError: Error, LocalizedError {
    case unknown, apiError(reason: String)

    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown error"
        case .apiError(let reason):
            return reason
        }
    }
}
