//
//  NEAPublishers.swift
//  
//
//  Created by Stuart Breckenridge on 27/01/2020.
//

import Foundation
import Combine


/// The `NEAPublishers` class surfaces publishers for each of the `data.gov.sg` NEA API endpoints.
///
///- note: This is currently a work in progress.
public final class NEAPublishers {
    
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
