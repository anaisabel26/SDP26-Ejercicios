//
//  WeatherView.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct WeatherView: View {
    @Environment(\.colorScheme) var colorScheme
    let city: City
    
    var body: some View {
        List {
            Section {
                Text(city.name)
                    .font(.system(.largeTitle, design: .monospaced, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .listRowBackground(Color.clear)
            .listRowInsets(.all, 0)
            
            if let current = city.weather.first {
                Section {
                    TemperatureCard(weather: current)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                .listRowBackground(Color.white.opacity(0.4))
                
                Section {
                    TemperatureByHourCard(temperatures: current.tempForHours)
                } header: {
                    Label("Hourly forecast".uppercased(), systemImage: "clock")
                }
                .listRowBackground(Color.white.opacity(0.4))
            }
            
            Section {
                ForEach(city.weather, id: \.day) { dailyWeather in
                    DailyWeatherRow(weather: dailyWeather)
                }
            } header: {
                Label("07-day forecast".uppercased(), systemImage: "clock")
            }
            .listRowBackground(Color.white.opacity(0.2))
        }
        .scrollContentBackground(.hidden)
        .navigationTitle("Weather")
        .navigationBarTitleDisplayMode(.inline)
        .background(LinearGradient(colors: [.blue, colorScheme == .light ? .gray.opacity(0.3) : .black], startPoint: .topTrailing, endPoint: .bottomLeading).ignoresSafeArea())
    }
}

#Preview {
    NavigationView {
        WeatherView(city: cityMockup)
    }
}
