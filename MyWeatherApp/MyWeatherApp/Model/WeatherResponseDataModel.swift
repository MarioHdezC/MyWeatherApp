//
//  WeatherResponseDataModel.swift
//  MyWeatherApp
//
//  Created by Mario Hernandez Corral on 15/7/22.
//

import Foundation

struct WeatherResponseDataModel: Decodable {
	let name: String
	let weather: [WeatherDataModel]
	let main: TemperatureDataModel
	let sys: SunModel
	let timezone: Double
}

struct SunModel: Decodable {
	let sunrise: Date
	let sunset: Date
}

struct WeatherDataModel: Decodable {
	let main: String
	let description: String
	let iconURLString: String
	
	enum CodingKeys: String, CodingKey {
		case main
		case description
		case iconURLString = "icon"
	}
}

struct TemperatureDataModel: Decodable {
	let currentTemperature: Double
	let minTemperature: Double
	let maxTemperature: Double
	let humidity: Int
	
	enum CodingKeys: String, CodingKey {
		case currentTemperature = "temp"
		case minTemperature = "temp_min"
		case maxTemperature = "temp_max"
		case humidity
	}
}
