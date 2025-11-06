//
//  DailyWeatherRow.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct DailyWeatherRow: View {
    let weather: Weather
    
    var body: some View {
        HStack(spacing: 16) {
            Text(weather.day, format: .dateTime.weekday(.short))
                .bold()
            
            Spacer()
            
            Image(systemName: weather.conditions.icon)
                .font(.system(size: 24))
                .symbolRenderingMode(.palette)
                .foregroundStyle(weather.conditions.primaryColor, weather.conditions.secondaryColor)
                .shadow(radius: 10)
            
            Spacer()
            
            Text("\(Int(weather.minTemp))°")
            
            ProgressView(value: progressValue)
                .tint(.blue)
                .frame(width: 100)
                
            Text("\(Int(weather.maxTemp))°")
        }
        .tint(.primary)
    }
    
    var progressValue: CGFloat {
        (weather.temperature - weather.minTemp) / (weather.maxTemp - weather.minTemp)
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.blue, .white], startPoint: .topTrailing, endPoint: .bottomLeading)
        
        DailyWeatherRow(weather: weatherMockup)
    }
}
