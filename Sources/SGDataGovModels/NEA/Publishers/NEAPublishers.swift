//
//  NEAPublishers.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation
import Combine


/// The `NEAPublishers` class surfaces publishers for each of the `data.gov.sg` NEA API endpoints.
public final class NEAPublishers {
    
    
    /// The publisher for PM 2.5 data.
    public static var pm25: AnyPublisher<PM25DataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.pm25.url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: PM25DataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for PSI data.
    public static var psi: AnyPublisher<PSIDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.psi.url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: PSIDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for UV Index data.
    public static var uvindex: AnyPublisher<UVIndexModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.uvi.url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: UVIndexModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for two hour forecast data.
    public static var twoHourForecast: AnyPublisher<ForecastDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.weatherForcast(duration: .twoHour).url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: ForecastDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for twenty-four hour forecast data.
    public static var twentyFourHourForecast: AnyPublisher<ForecastDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.weatherForcast(duration: .twentyFourHour).url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: ForecastDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for four day forecast data.
    public static var fourDayForecast: AnyPublisher<ForecastDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.weatherForcast(duration: .fourDays).url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: ForecastDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for the current air temperature.
    public static var airTemperature: AnyPublisher<RealTimeWeatherDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.realTimeWeather(type: .airTemperature).url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: RealTimeWeatherDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for the current rainfall.
    public static var rainfall: AnyPublisher<RealTimeWeatherDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.realTimeWeather(type: .rainfall).url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: RealTimeWeatherDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for the current humidity.
    public static var humidity: AnyPublisher<RealTimeWeatherDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.realTimeWeather(type: .humidity).url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: RealTimeWeatherDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for the current wind direction.
    public static var windDirection: AnyPublisher<RealTimeWeatherDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.realTimeWeather(type: .windDirection).url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: RealTimeWeatherDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
    /// The publisher for the current wind speed.
    public static var windSpeed: AnyPublisher<RealTimeWeatherDataModel, Error> {
        return URLSession.shared.dataTaskPublisher(for: NEAService.realTimeWeather(type: .windSpeed).url)
        .tryMap { data, response in
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                throw APIError.unknown
            }
            return data
            }
        .decode(type: RealTimeWeatherDataModel.self, decoder: JSONDecoder())
        .mapError { error in
            if let error = error as? APIError {
                return error
            } else {
                return APIError.apiError(reason: error.localizedDescription)
            }
        }
        .eraseToAnyPublisher()
    }
    
}
