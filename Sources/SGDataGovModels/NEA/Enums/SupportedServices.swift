//
//  SupportedServices.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation


/// The `NEAService` enum contains a description, service information, and associated endpoint for each support NEA endpoint.
public enum NEAService: APIInformation {
    
    case pm25, psi, uvi, weatherForcast(duration: ForecastDuration), realTimeWeather(type: RealTimeWeather)
    
    public var description: String {
        switch self {
        case .pm25:
            return "PM 2.5"
        case .psi:
            return "Pollutant Standards Index (PSI)"
        case .uvi:
            return "Ultra-violet Index"
        case .weatherForcast(duration: let d):
            switch d {
            case .twoHour:
                return "2-hour Weather Forecast"
            case .twentyFourHour:
                return "24-hour Weather Forecast"
            case .fourDays:
                return "4-day Weather Forecast"
            }
        case .realTimeWeather(let type):
            switch type {
            case .airTemperature:
                return "Air Temperature"
            case .humidity:
                return "Relative Humidity"
            case .rainfall:
                return "Rainfall"
            case .windDirection:
                return "Wind Direction"
            case .windSpeed:
                return "Wind Speed"
            }
        }
    }
    
    public var serviceInformation: String {
        switch self {
        case .pm25:
            return "Regional hourly PM2.5 value measured in μg/m3."
        case .psi:
            return "Overall and regional PSI data (24-hr PSI, Pollutant Concentration and Sub-Index)"
        case .uvi:
            return "UV Index value averaged over the past hour. Updated every hour between 7 AM and 7 PM everyday."
        case .weatherForcast(duration: let d):
            switch d {
            default:
                return "Weather forecast for next 2 hours, next 24 hours and next 4 days."
            }
        case .realTimeWeather(type: let type):
            switch type {
            default:
                return "NEA provides APIs for readings of temperature, humidity, precipitation and wind conditions at up to one-minute intervals. The data is provided at weather-station level."
            }
        }
    }
    
    public var url: URL {
        switch self {
        case .pm25:
            return URL(string: "https://api.data.gov.sg/v1/environment/pm25")!
        case .psi:
            return URL(string: "https://api.data.gov.sg/v1/environment/psi")!
        case .uvi:
            return URL(string: "https://api.data.gov.sg/v1/environment/uv-index")!
        case .weatherForcast(duration: let d):
        switch d {
        case .twoHour:
            return URL(string: "https://api.data.gov.sg/v1/environment/2-hour-weather-forecast")!
        case .twentyFourHour:
            return URL(string: "https://api.data.gov.sg/v1/environment/24-hour-weather-forecast")!
        case .fourDays:
            return URL(string: "https://api.data.gov.sg/v1/environment/4-day-weather-forecast")!
            }
            
        case .realTimeWeather(type: let type):
            switch type {
            case .airTemperature:
                return URL(string: "https://api.data.gov.sg/v1/environment/air-temperature")!
            case .humidity:
                return URL(string: "https://api.data.gov.sg/v1/environment/relative-humidity")!
            case .rainfall:
                return URL(string: "https://api.data.gov.sg/v1/environment/rainfall")!
            case .windDirection:
                return URL(string: "https://api.data.gov.sg/v1/environment/wind-direction")!
            case .windSpeed:
                return URL(string: "https://api.data.gov.sg/v1/environment/wind-speed")!
            }
        }
    
    }
    
    
}
