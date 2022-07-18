//
//  WeatherModelMapper.swift
//  MyWeatherApp
//
//  Created by Mario Hernandez Corral on 15/7/22.
//

import Foundation

struct WeatherModelMapper {
	func mapDataModelToModel(dataModel: WeatherResponseDataModel) -> WeatherModel {
		guard let weather = dataModel.weather.first else { return .empty }
		
		let temperature = dataModel.main
		
		let sunsetWithTimezone = dataModel.sys.sunset.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
		let sunrisetWithTimezone = dataModel.sys.sunrise.addingTimeInterval(dataModel.timezone - Double(TimeZone.current.secondsFromGMT()))
		
		return WeatherModel(city: dataModel.name,
							weateher: weather.main,
							description: "(\(weather.description))",
							iconURL: URL(string: "https://openweathermap.org/img/wn/\(weather.iconURLString)@2x.png"),
							currentTemperature: "\(Int(temperature.currentTemperature))º",
							minTemperature: "\(Int(temperature.minTemperature))º Min.",
							maxTemperature: "\(Int(temperature.maxTemperature))º Max.",
							humidity: "\(temperature.humidity)%",
							sunset: sunsetWithTimezone,
							sunrise: sunrisetWithTimezone)
	}
}
