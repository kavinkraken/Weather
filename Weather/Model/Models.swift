//
//  Models.swift
//  Weather
//
//  Created by Kavinkumar S Thangammal on 19/11/22.
//

import UIKit

//   let foreCast = try? newJSONDecoder().decode(ForeCast.self, from: jsonData)

// MARK: - ForeCast
struct ForeCastModel: Codable {
    var location: Location?
    var current: Current?
    var forecast: Forecast?
    
    func getCountry() -> String {
        return location?.country ?? ""
    }
    func getCity() -> String {
        return location?.name ?? ""
    }
    func getDate() -> String {
        return location?.localtime ?? ""
    }
    func getCurrentTemp() -> String {
        return "\(current?.tempC ?? 0) °C"
    }
    
    func getForeCastListCount() -> Int {
        return forecast?.forecastday?.count ?? 0
    }
}

// MARK: - Current
struct Current: Codable {
    var lastUpdatedEpoch: Int?
    var lastUpdated: String?
    var tempC, tempF: Double?

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    var forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    var date: String?
    var day: Day?

    enum CodingKeys: String, CodingKey {
        case date
        case day
    }
    
    func getMinMaxTemp() -> String {
        return "\(day?.mintempC ?? 0) - \(day?.maxtempC ?? 0) °C"
    }
    func getIcon() -> String {
        var urlStr = self.day?.condition?.icon ?? ""
        if !(urlStr.lowercased().contains("http")) {
            urlStr = "https:\(urlStr)"
        }
        return urlStr
    }
}

// MARK: - Day
struct Day: Codable {
    var maxtempC, maxtempF, mintempC, mintempF: Double?
    var condition: Condition?
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case condition
    }
}

// MARK: - Location
struct Location: Codable {
    var name, region, country: String?
    var lat, lon: Double?
    var tzID: String?
    var localtimeEpoch: Int?
    var localtime: String?

    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
// MARK: - Condition
struct Condition: Codable {
    var text: String?
    var icon: String?
    var code: Int?
}
