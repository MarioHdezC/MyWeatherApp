//
//  MainWeatherView.swift
//  MyWeatherApp
//
//  Created by Mario Hernandez Corral on 18/7/22.
//

import SwiftUI

struct MainWeatherView: View {
	
	@StateObject private var vm = WeatherViewModel()
	@State private var searchedCity = "Salamanca"
	@State private var presentSheet = false
	var city: String = "Salamanca"
	
	var body: some View {
		ZStack {
			VStack {
				
				Text(vm.weatherModel.city)
					.foregroundColor(.white)
					.font(.system(size: 70))
					.padding(.top, 20)
				
				Text(vm.weatherModel.description)
					.font(.headline)
					.foregroundColor(.white)
					.padding(.bottom, 8)
				
				HStack {
					if let iconURL = vm.weatherModel.iconURL {
						AsyncImage(url: iconURL) { image in
							image
						} placeholder: {
							ProgressView()
						}
					}
					
					Text(vm.weatherModel.currentTemperature)
						.font(.system(size: 70))
						.foregroundColor(.white)
				}
				.padding(.top, -20)
				
				HStack(spacing: 14) {
					Label(vm.weatherModel.minTemperature, systemImage: "thermometer.snowflake")
					Label(vm.weatherModel.maxTemperature, systemImage: "thermometer.sun.fill")
				}
				.symbolRenderingMode(.multicolor)
				.foregroundColor(.white)
				
				Divider()
					.foregroundColor(.white)
					.padding()
				
				HStack(spacing: 32) {
					
					VStack {
						Image(systemName: "sunrise.fill")
							.symbolRenderingMode(.multicolor)
						Text(vm.weatherModel.sunrise, style: .time)
							.padding(.top, 5)
					}
					
					VStack {
						Image(systemName: "sunset.fill")
							.symbolRenderingMode(.multicolor)
						Text(vm.weatherModel.sunset, style: .time)
							.padding(.top, 5)
					}
				}
				
				Divider()
					.foregroundColor(.white)
					.padding()
				
				Label(vm.weatherModel.humidity, systemImage: "humidity.fill")
					.symbolRenderingMode(.multicolor)
					.foregroundColor(.white)
				
				VStack {
					Label("Choose a city", systemImage: "mappin.and.ellipse")
					
					Picker("Choose a city", selection: $searchedCity) {
						ForEach(vm.spainCities.spainCities, id: \.self) {
							Text($0)
						}
					}
				}
				.padding(.top, 20)
				
				Spacer()
			}
		}
		.background(
			LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
		)
		.onAppear {
			vm.getWeather(city: searchedCity.description)
		}
		.onChange(of: searchedCity) { newValue in
			vm.getWeather(city: newValue.description)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		MainWeatherView()
	}
}

