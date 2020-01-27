//
//  SupportedServices.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation




/// The `NEAService` enum contains a description, service information, and associated endpoint for each support NEA endpoint.
public enum NEAService: String, CaseIterable, APIInformation {
    
    case pm25
    
    public var description: String {
        switch self {
        case .pm25:
            return "PM 2.5"
        }
    }
    
    public var serviceInformation: String {
        switch self {
        case .pm25:
            return "Regional hourly PM2.5 value measured in μg/m3."
        }
    }
    
    public var url: URL {
        switch self {
        case .pm25:
            return URL(string: "https://api.data.gov.sg/v1/environment/pm25")!
        }
    }
    
    
}
