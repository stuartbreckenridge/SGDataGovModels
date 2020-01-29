//
//  File.swift
//  
//
//  Created by Stuart Breckenridge on 29/01/2020.
//

import Foundation


/// `RealTimeWeather` is used to differentiate between the different real time weather readings supported by the data.gov.sg API.
public enum RealTimeWeather {
    case airTemperature, rainfall, humidity, windDirection, windSpeed
}
