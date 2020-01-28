//
//  ForecastDuration.swift
//  
//
//  Created by Stuart Breckenridge on 28/01/2020.
//

import Foundation

/// `ForecastDuration` is used to differentiate between the different forecast timeframes offered by the weather forecast API.
public enum ForecastDuration {
    case twoHour, twentyFourHour, fourDays
}
