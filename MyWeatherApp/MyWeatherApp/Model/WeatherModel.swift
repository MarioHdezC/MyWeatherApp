//
//  WeatherModel.swift
//  MyWeatherApp
//
//  Created by Mario Hernandez Corral on 15/7/22.
//

import Foundation

struct WeatherModel {
	let city: String
	let weateher: String
	let description: String
	let iconURL: URL?
	let currentTemperature: String
	let minTemperature: String
	let maxTemperature: String
	let humidity: String
	let sunset: Date
	let sunrise: Date
	
	static let empty: WeatherModel = .init(city: "No city", weateher: "No weather", description: "No description", iconURL: nil, currentTemperature: "0º", minTemperature: "0º Min.", maxTemperature: "0º Max.", humidity: "0%", sunset: .now, sunrise: .now)
	
	
}
