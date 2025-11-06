//
//  TemperatureByHourCard.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct TemperatureByHourCard: View {
    let temperatures: [String: HourlyWeather]
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(1..<7) { index in
                let key = index.formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 0)))
                
                if let item = temperatures["\(key)"] {
                    VStack(alignment: .center, spacing: 20) {
                        Text("\(key)")
                            .bold()
                        
                        Image(systemName: item.conditions.icon)
                            .font(.title)
                            .foregroundStyle(.blue)
                            .frame(width: 24, height: 30)
                        
                        Text("\(Int(item.temperature))C")
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)//, alignment: .center)
    }
}

#Preview {
    ZStack {
        LinearGradient(colors: [.blue, .white], startPoint: .topTrailing, endPoint: .bottomLeading)
            .ignoresSafeArea()
        
        TemperatureByHourCard(temperatures: weatherMockup.tempForHours)
            .padding()
    }
}
