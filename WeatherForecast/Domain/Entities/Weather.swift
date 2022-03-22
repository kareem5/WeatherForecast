//
//  CityWeather.swift
//  WeatherForecast
//
//  Created by Kareem Ahmed on 13/03/2022.
//

import Foundation

// MARK: - CityWeather
struct CityWeather: Codable, Hashable {
    let consolidatedWeather: [ConsolidatedWeather]?
    let time, sunRise, sunSet, timezoneName: String?
    let country: Location?
    let sources: [Source]?
    let title, locationType: String?
    let woeid: Int?
    let lattLong, timezone: String?
    var tomorrowWeather: ConsolidatedWeather? {
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let tomorrowString = dateFormatter.string(from: tomorrow)
        guard let weather = consolidatedWeather?.first(where: { $0.applicableDate == tomorrowString}) else { return nil }
        
        return weather
    }

    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
        case time
        case sunRise = "sun_rise"
        case sunSet = "sun_set"
        case timezoneName = "timezone_name"
        case country = "parent"
        case sources, title
        case locationType = "location_type"
        case woeid
        case lattLong = "latt_long"
        case timezone
    }
    
    static func == (lhs: CityWeather, rhs: CityWeather) -> Bool {
        return lhs.woeid == rhs.woeid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(woeid)
    }
}

// MARK: - ConsolidatedWeather
struct ConsolidatedWeather: Codable {
    let id: Int?
    let weatherStateName, weatherStateAbbr, windDirectionCompass, created: String
    let applicableDate: String
    let minTemp, maxTemp, theTemp, windSpeed: Double
    let windDirection: Double?
    let airPressure, humidity: Double?
    let visibility: Double?
    let predictability: Int?
    
    var minTempInt: Int {
        return Int(minTemp.rounded())
    }
    
    var maxTempInt: Int {
        return Int(maxTemp.rounded())
    }

    enum CodingKeys: String, CodingKey {
        case id
        case weatherStateName = "weather_state_name"
        case weatherStateAbbr = "weather_state_abbr"
        case windDirectionCompass = "wind_direction_compass"
        case created
        case applicableDate = "applicable_date"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case theTemp = "the_temp"
        case windSpeed = "wind_speed"
        case windDirection = "wind_direction"
        case airPressure = "air_pressure"
        case humidity, visibility, predictability
    }
}

// MARK: - Source
struct Source: Codable {
    let title, slug: String?
    let url: String?
    let crawlRate: Int?

    enum CodingKeys: String, CodingKey {
        case title, slug, url
        case crawlRate = "crawl_rate"
    }
}