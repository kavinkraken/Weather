//
//  WeatherController.swift
//  Weather
//
//  Created by Kavinkumar S Thangammal on 19/11/22.
//

import UIKit
protocol WeatherDelegate {
    func reloadData()
}
class WeatherController {
    private var modelWeatherDetails: ForeCastModel?
    var delegate: WeatherDelegate?
    
    init( delegate: WeatherDelegate? = nil) {
        self.delegate = delegate
        self.getWeatherDetails(query: "Rasipuram")
    }
    func getWeatherDetails(query: String) {
        ServerCallController.callForGet(urlString: "https://api.weatherapi.com/v1/forecast.json?key=\(AppConstants.apikey)&q=\(query)&days=7&aqi=no&alerts=no") { success, response, message in
            if success {
                let responseDetails = try? JSONDecoder().decode(ForeCastModel.self, from: response ?? Data())
                self.modelWeatherDetails = responseDetails
                self.delegate?.reloadData()
            }
        }
    }
    
    func numberOfRowsInSection( section: Int) -> Int {
        return section == 0 ? 1 : modelWeatherDetails == nil ? 0 : (modelWeatherDetails?.getForeCastListCount() ?? 0)
    }
    
    func cellForRowAt(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell", for: indexPath) as! HeaderTableViewCell
            cell.headerDetails = modelWeatherDetails
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell", for: indexPath) as! ForecastTableViewCell
            cell.forecastDetails = modelWeatherDetails?.forecast?.forecastday?[indexPath.row]
            return cell
        }
    }
}
