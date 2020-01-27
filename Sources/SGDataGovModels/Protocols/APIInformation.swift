//
//  APIInformation.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation

/// The `APIInformation` protocol ensures that conforming types include service information and a `URL` resource.
///
/// Types that conform to the `APIInformation` protocol must include a `url` (`URL`) and a `serviceInformation` (`String`).
public protocol APIInformation {
    var url: URL { get }
    var serviceInformation: String { get }
}
