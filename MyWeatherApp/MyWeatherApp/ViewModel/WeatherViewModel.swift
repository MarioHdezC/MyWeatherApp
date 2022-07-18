//
//  WeatherViewModel.swift
//  MyWeatherApp
//
//  Created by Mario Hernandez Corral on 15/7/22.
//

import Foundation

final class WeatherViewModel: ObservableObject {
	
	@Published var weatherModel: WeatherModel = .empty
	private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
	let spainCities = CitiesModel(spainCities: ["Alava", "Avila", "Albacete", "Alicante", "Almeria",
												"Asturias", "Badajoz", "Baleares", "Barcelona", "Bilbao",
												"Burgos", "Cantabria", "Castellón", "Ceuta", "Ciudad Real",
												"Coruña", "Cuenca", "Caceres", "Cádiz", "Cordoba", "Donostia",
												"El Hierro", "Fuerteventura", "Gerona", "Granada", "Huelva",
												"Ibiza", "Huesca", "Jaen", "Las Palmas de Gran Canaria", "La Palma",
												"La Gomera", "Lanzarote", "Leon", "Lleida", "Lugo", "Madrid", "Melilla",
												"Menorca", "Murcia", "Malaga", "Mallorca", "Navarra", "Orense",
												"Palencia", "Pontevedra", "Rioja", "Salamanca", "Segovia",
												"Sevilla", "Soria", "Tarragona", "Tenerife", "Teruel", "Toledo",
												"Valencia", "Valladolid", "Zamora", "Zaragoza"])
	
	func getWeather(city: String) {
		
		guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=874e9ff8c52f4c23388058048ab9bca2&units=metric&lang=es") else { return }
		
		URLSession.shared.dataTask(with: url) {data, response, error in
			
			guard let data = data else { return }
			
			//3 -> Decodificar datos del json recibido
			if let decodeData = try? JSONDecoder().decode(WeatherResponseDataModel.self, from: data){
				
				//Exito, asignamos decode data a la variable state picData
				DispatchQueue.main.async {
					self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: decodeData)
				}
			}
		}.resume()
	}
}
