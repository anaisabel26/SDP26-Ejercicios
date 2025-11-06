//
//  CurrentTemperatureCard.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct TemperatureCard: View {
    let weather: Weather
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading) {
                Text("\(Int(weather.temperature))°")
                    .font(.system(size: 70, weight: .black, design: .monospaced))
                    .foregroundStyle(.primary)
                
                Text(weather.conditions.rawValue.capitalized)
                    .font(.system(.title2, weight: .semibold))
                    .foregroundStyle(.primary)
                
                Text("Máx \(Int(weather.maxTemp))°   Mín \(Int(weather.minTemp))°")
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.primary)
            }
            
            Spacer()
            
            Image(systemName: weather.conditions.icon)
                .font(.system(size: 100))
                .symbolRenderingMode(.palette)
                .foregroundStyle(weather.conditions.primaryColor, weather.conditions.secondaryColor)
        }
//        .padding(24)
//        .background(.white.opacity(0.2), in: RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.blue, .white], startPoint: .topTrailing, endPoint: .bottomLeading)
            .ignoresSafeArea()
        
        TemperatureCard(weather: weatherMockup)
            .padding()
    }
}
