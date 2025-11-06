//
//  WeatherModel.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

protocol WeatherInfo: Equatable {
    var conditions: Weather.Condition { get }
    var temperature: Double { get }
}

struct HourlyWeather: WeatherInfo {
    let conditions: Weather.Condition
    let temperature: Double
}

struct City: Identifiable {
    let id = UUID()
    let name: String
    let weather: [Weather]
}

struct Weather: WeatherInfo {
    let day: Date
    let conditions: Condition
    let temperature: Double
    let tempForHours: [String: HourlyWeather]
    
    var maxTemp: Double {
        tempForHours.values.map { $0.temperature }.max() ?? temperature
    }
    
    var minTemp: Double {
        tempForHours.values.map { $0.temperature }.min() ?? 0.0
    }
    
    enum Condition: String {
        case soleado
        case nublado
        case lluvioso
        case parcialmenteNublado = "Parcialmente Nublado"
        case nevoso
        
        var icon: String {
            switch self {
            case .soleado: 
                return "sun.min.fill"
            case .nublado:
                return "cloud.fill"
            case .lluvioso:
                return "cloud.heavyrain.fill"
            case .parcialmenteNublado:
                return "cloud.sun.fill"
            case .nevoso:
                return "cloud.snow.fill"
            }
        }
        
        var primaryColor: Color {
            self == .soleado ? .yellow  : .white
        }
        
        var secondaryColor: Color {
            switch self {
            case .soleado, .parcialmenteNublado:
                return .yellow
            case .lluvioso, .nevoso, .nublado:
                return .blue
            }
        }
    }
}

// MARK: Mock ups

let weatherMockup = Weather(day: Date(), conditions: .parcialmenteNublado, temperature: 13.5, tempForHours: [
    "00": HourlyWeather(conditions: .nublado, temperature: 11.0),
    "01": HourlyWeather(conditions: .nublado, temperature: 10.8),
    "02": HourlyWeather(conditions: .nublado, temperature: 10.4),
    "03": HourlyWeather(conditions: .lluvioso, temperature: 10.1),
    "04": HourlyWeather(conditions: .nublado, temperature: 10.0),
    "05": HourlyWeather(conditions: .nublado, temperature: 10.2),
    "06": HourlyWeather(conditions: .parcialmenteNublado, temperature: 10.7),
    "07": HourlyWeather(conditions: .nublado, temperature: 11.5),
    "08": HourlyWeather(conditions: .nublado, temperature: 12.2),
    "09": HourlyWeather(conditions: .nublado, temperature: 12.7),
    "10": HourlyWeather(conditions: .nublado, temperature: 13.0),
    "11": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.4),
    "12": HourlyWeather(conditions: .nublado, temperature: 13.5),
    "13": HourlyWeather(conditions: .nublado, temperature: 13.7),
    "14": HourlyWeather(conditions: .nublado, temperature: 14.0),
    "15": HourlyWeather(conditions: .nublado, temperature: 13.9),
    "16": HourlyWeather(conditions: .nublado, temperature: 13.3),
    "17": HourlyWeather(conditions: .lluvioso, temperature: 12.8),
    "18": HourlyWeather(conditions: .nublado, temperature: 12.0),
    "19": HourlyWeather(conditions: .nublado, temperature: 11.8),
    "20": HourlyWeather(conditions: .lluvioso, temperature: 11.5),
    "21": HourlyWeather(conditions: .nublado, temperature: 11.3),
    "22": HourlyWeather(conditions: .parcialmenteNublado, temperature: 11.2),
    "23": HourlyWeather(conditions: .nublado, temperature: 11.1)
])

let cityMockup = City(name: "London", weather: [
    Weather(day: Date(), conditions: .nublado, temperature: 13.5, tempForHours: [
        "00": HourlyWeather(conditions: .nublado, temperature: 11.0),
        "01": HourlyWeather(conditions: .parcialmenteNublado, temperature: 10.8),
        "02": HourlyWeather(conditions: .lluvioso, temperature: 10.4),
        "03": HourlyWeather(conditions: .lluvioso, temperature: 10.1),
        "04": HourlyWeather(conditions: .nevoso, temperature: 10.0),
        "05": HourlyWeather(conditions: .nevoso, temperature: 10.2),
        "06": HourlyWeather(conditions: .parcialmenteNublado, temperature: 10.7),
        "07": HourlyWeather(conditions: .soleado, temperature: 11.5),
        "08": HourlyWeather(conditions: .soleado, temperature: 12.2),
        "09": HourlyWeather(conditions: .parcialmenteNublado, temperature: 12.7),
        "10": HourlyWeather(conditions: .nublado, temperature: 13.0),
        "11": HourlyWeather(conditions: .soleado, temperature: 13.4),
        "12": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.5),
        "13": HourlyWeather(conditions: .nublado, temperature: 13.7),
        "14": HourlyWeather(conditions: .lluvioso, temperature: 14.0),
        "15": HourlyWeather(conditions: .soleado, temperature: 13.9),
        "16": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.3),
        "17": HourlyWeather(conditions: .lluvioso, temperature: 12.8),
        "18": HourlyWeather(conditions: .nevoso, temperature: 12.0),
        "19": HourlyWeather(conditions: .parcialmenteNublado, temperature: 11.8),
        "20": HourlyWeather(conditions: .nevoso, temperature: 11.5),
        "21": HourlyWeather(conditions: .parcialmenteNublado, temperature: 11.3),
        "22": HourlyWeather(conditions: .soleado, temperature: 11.2),
        "23": HourlyWeather(conditions: .nublado, temperature: 11.1)
    ]),
    Weather(day: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, conditions: .soleado, temperature: 16.0, tempForHours: [
        "00": HourlyWeather(conditions: .nublado, temperature: 13.5),
        "01": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.3),
        "02": HourlyWeather(conditions: .lluvioso, temperature: 13.0),
        "03": HourlyWeather(conditions: .lluvioso, temperature: 12.7),
        "04": HourlyWeather(conditions: .nevoso, temperature: 12.5),
        "05": HourlyWeather(conditions: .nevoso, temperature: 12.7),
        "06": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.2),
        "07": HourlyWeather(conditions: .soleado, temperature: 14.0),
        "08": HourlyWeather(conditions: .soleado, temperature: 14.8),
        "09": HourlyWeather(conditions: .parcialmenteNublado, temperature: 15.3),
        "10": HourlyWeather(conditions: .nublado, temperature: 15.7),
        "11": HourlyWeather(conditions: .soleado, temperature: 15.9),
        "12": HourlyWeather(conditions: .parcialmenteNublado, temperature: 16.0),
        "13": HourlyWeather(conditions: .nublado, temperature: 16.2),
        "14": HourlyWeather(conditions: .lluvioso, temperature: 16.5),
        "15": HourlyWeather(conditions: .soleado, temperature: 16.4),
        "16": HourlyWeather(conditions: .parcialmenteNublado, temperature: 15.9),
        "17": HourlyWeather(conditions: .lluvioso, temperature: 15.3),
        "18": HourlyWeather(conditions: .nevoso, temperature: 14.5),
        "19": HourlyWeather(conditions: .parcialmenteNublado, temperature: 14.3),
        "20": HourlyWeather(conditions: .nevoso, temperature: 14.0),
        "21": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.8),
        "22": HourlyWeather(conditions: .soleado, temperature: 13.7),
        "23": HourlyWeather(conditions: .nublado, temperature: 13.6)
    ]),
    Weather(day: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, conditions: .lluvioso, temperature: 11.0, tempForHours: [
        "00": HourlyWeather(conditions: .nublado, temperature: 9.0),
        "01": HourlyWeather(conditions: .parcialmenteNublado, temperature: 8.8),
        "02": HourlyWeather(conditions: .lluvioso, temperature: 8.4),
        "03": HourlyWeather(conditions: .lluvioso, temperature: 8.1),
        "04": HourlyWeather(conditions: .nevoso, temperature: 8.0),
        "05": HourlyWeather(conditions: .nevoso, temperature: 8.2),
        "06": HourlyWeather(conditions: .parcialmenteNublado, temperature: 8.7),
        "07": HourlyWeather(conditions: .soleado, temperature: 9.5),
        "08": HourlyWeather(conditions: .soleado, temperature: 10.2),
        "09": HourlyWeather(conditions: .parcialmenteNublado, temperature: 10.7),
        "10": HourlyWeather(conditions: .nublado, temperature: 11.0),
        "11": HourlyWeather(conditions: .soleado, temperature: 11.4),
        "12": HourlyWeather(conditions: .parcialmenteNublado, temperature: 11.5),
        "13": HourlyWeather(conditions: .nublado, temperature: 11.7),
        "14": HourlyWeather(conditions: .lluvioso, temperature: 12.0),
        "15": HourlyWeather(conditions: .soleado, temperature: 11.9),
        "16": HourlyWeather(conditions: .parcialmenteNublado, temperature: 11.3),
        "17": HourlyWeather(conditions: .lluvioso, temperature: 10.8),
        "18": HourlyWeather(conditions: .nevoso, temperature: 10.0),
        "19": HourlyWeather(conditions: .parcialmenteNublado, temperature: 9.8),
        "20": HourlyWeather(conditions: .nevoso, temperature: 9.5),
        "21": HourlyWeather(conditions: .parcialmenteNublado, temperature: 9.3),
        "22": HourlyWeather(conditions: .soleado, temperature: 9.2),
        "23": HourlyWeather(conditions: .nublado, temperature: 9.1)
    ]),
    Weather(day: Calendar.current.date(byAdding: .day, value: 3, to: Date())!, conditions: .parcialmenteNublado, temperature: 14.5, tempForHours: [
        "00": HourlyWeather(conditions: .nublado, temperature: 12.0),
        "01": HourlyWeather(conditions: .parcialmenteNublado, temperature: 11.8),
        "02": HourlyWeather(conditions: .lluvioso, temperature: 11.4),
        "03": HourlyWeather(conditions: .lluvioso, temperature: 11.1),
        "04": HourlyWeather(conditions: .nevoso, temperature: 11.0),
        "05": HourlyWeather(conditions: .nevoso, temperature: 11.2),
        "06": HourlyWeather(conditions: .parcialmenteNublado, temperature: 11.7),
        "07": HourlyWeather(conditions: .soleado, temperature: 12.5),
        "08": HourlyWeather(conditions: .soleado, temperature: 13.2),
        "09": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.7),
        "10": HourlyWeather(conditions: .nublado, temperature: 14.0),
        "11": HourlyWeather(conditions: .soleado, temperature: 14.4),
        "12": HourlyWeather(conditions: .parcialmenteNublado, temperature: 14.5),
        "13": HourlyWeather(conditions: .nublado, temperature: 14.7),
        "14": HourlyWeather(conditions: .lluvioso, temperature: 15.0),
        "15": HourlyWeather(conditions: .soleado, temperature: 14.9),
        "16": HourlyWeather(conditions: .parcialmenteNublado, temperature: 14.3),
        "17": HourlyWeather(conditions: .lluvioso, temperature: 13.8),
        "18": HourlyWeather(conditions: .nevoso, temperature: 13.0),
        "19": HourlyWeather(conditions: .parcialmenteNublado, temperature: 12.8),
        "20": HourlyWeather(conditions: .nevoso, temperature: 12.5),
        "21": HourlyWeather(conditions: .parcialmenteNublado, temperature: 12.3),
        "22": HourlyWeather(conditions: .soleado, temperature: 12.2),
        "23": HourlyWeather(conditions: .nublado, temperature: 12.1)
    ]),
    Weather(day: Calendar.current.date(byAdding: .day, value: 4, to: Date())!, conditions: .nevoso, temperature: 2.0, tempForHours: [
        "00": HourlyWeather(conditions: .nublado, temperature: 0.5),
        "01": HourlyWeather(conditions: .parcialmenteNublado, temperature: 0.3),
        "02": HourlyWeather(conditions: .lluvioso, temperature: 0.0),
        "03": HourlyWeather(conditions: .lluvioso, temperature: -0.3),
        "04": HourlyWeather(conditions: .nevoso, temperature: -0.5),
        "05": HourlyWeather(conditions: .nevoso, temperature: -0.3),
        "06": HourlyWeather(conditions: .parcialmenteNublado, temperature: 0.2),
        "07": HourlyWeather(conditions: .soleado, temperature: 1.0),
        "08": HourlyWeather(conditions: .soleado, temperature: 1.7),
        "09": HourlyWeather(conditions: .parcialmenteNublado, temperature: 2.2),
        "10": HourlyWeather(conditions: .nublado, temperature: 2.5),
        "11": HourlyWeather(conditions: .soleado, temperature: 2.7),
        "12": HourlyWeather(conditions: .parcialmenteNublado, temperature: 2.8),
        "13": HourlyWeather(conditions: .nublado, temperature: 3.0),
        "14": HourlyWeather(conditions: .lluvioso, temperature: 3.2),
        "15": HourlyWeather(conditions: .soleado, temperature: 3.1),
        "16": HourlyWeather(conditions: .parcialmenteNublado, temperature: 2.5),
        "17": HourlyWeather(conditions: .lluvioso, temperature: 2.0),
        "18": HourlyWeather(conditions: .nevoso, temperature: 1.2),
        "19": HourlyWeather(conditions: .parcialmenteNublado, temperature: 1.0),
        "20": HourlyWeather(conditions: .nevoso, temperature: 0.7),
        "21": HourlyWeather(conditions: .parcialmenteNublado, temperature: 0.5),
        "22": HourlyWeather(conditions: .soleado, temperature: 0.4),
        "23": HourlyWeather(conditions: .nublado, temperature: 0.3)
    ]),
    Weather(day: Calendar.current.date(byAdding: .day, value: 5, to: Date())!, conditions: .nublado, temperature: 12.0, tempForHours: [
        "00": HourlyWeather(conditions: .nublado, temperature: 10.0),
        "01": HourlyWeather(conditions: .parcialmenteNublado, temperature: 9.8),
        "02": HourlyWeather(conditions: .lluvioso, temperature: 9.4),
        "03": HourlyWeather(conditions: .lluvioso, temperature: 9.1),
        "04": HourlyWeather(conditions: .nevoso, temperature: 9.0),
        "05": HourlyWeather(conditions: .nevoso, temperature: 9.2),
        "06": HourlyWeather(conditions: .parcialmenteNublado, temperature: 9.7),
        "07": HourlyWeather(conditions: .soleado, temperature: 10.5),
        "08": HourlyWeather(conditions: .soleado, temperature: 11.2),
        "09": HourlyWeather(conditions: .parcialmenteNublado, temperature: 11.7),
        "10": HourlyWeather(conditions: .nublado, temperature: 12.0),
        "11": HourlyWeather(conditions: .soleado, temperature: 12.4),
        "12": HourlyWeather(conditions: .parcialmenteNublado, temperature: 12.5),
        "13": HourlyWeather(conditions: .nublado, temperature: 12.7),
        "14": HourlyWeather(conditions: .lluvioso, temperature: 13.0),
        "15": HourlyWeather(conditions: .soleado, temperature: 12.9),
        "16": HourlyWeather(conditions: .parcialmenteNublado, temperature: 12.3),
        "17": HourlyWeather(conditions: .lluvioso, temperature: 11.8),
        "18": HourlyWeather(conditions: .nevoso, temperature: 11.0),
        "19": HourlyWeather(conditions: .parcialmenteNublado, temperature: 10.8),
        "20": HourlyWeather(conditions: .nevoso, temperature: 10.5),
        "21": HourlyWeather(conditions: .parcialmenteNublado, temperature: 10.3),
        "22": HourlyWeather(conditions: .soleado, temperature: 10.2),
        "23": HourlyWeather(conditions: .nublado, temperature: 10.1)
    ]),
    Weather(day: Calendar.current.date(byAdding: .day, value: 6, to: Date())!, conditions: .soleado, temperature: 17.0, tempForHours: [
        "00": HourlyWeather(conditions: .nublado, temperature: 14.0),
        "01": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.8),
        "02": HourlyWeather(conditions: .lluvioso, temperature: 13.4),
        "03": HourlyWeather(conditions: .lluvioso, temperature: 13.1),
        "04": HourlyWeather(conditions: .nevoso, temperature: 13.0),
        "05": HourlyWeather(conditions: .nevoso, temperature: 13.2),
        "06": HourlyWeather(conditions: .parcialmenteNublado, temperature: 13.7),
        "07": HourlyWeather(conditions: .soleado, temperature: 14.5),
        "08": HourlyWeather(conditions: .soleado, temperature: 15.2),
        "09": HourlyWeather(conditions: .parcialmenteNublado, temperature: 15.7),
        "10": HourlyWeather(conditions: .nublado, temperature: 16.0),
        "11": HourlyWeather(conditions: .soleado, temperature: 16.4),
        "12": HourlyWeather(conditions: .parcialmenteNublado, temperature: 16.5),
        "13": HourlyWeather(conditions: .nublado, temperature: 16.7),
        "14": HourlyWeather(conditions: .lluvioso, temperature: 17.0),
        "15": HourlyWeather(conditions: .soleado, temperature: 16.9),
        "16": HourlyWeather(conditions: .parcialmenteNublado, temperature: 16.3),
        "17": HourlyWeather(conditions: .lluvioso, temperature: 15.8),
        "18": HourlyWeather(conditions: .nevoso, temperature: 15.0),
        "19": HourlyWeather(conditions: .parcialmenteNublado, temperature: 14.8),
        "20": HourlyWeather(conditions: .nevoso, temperature: 14.5),
        "21": HourlyWeather(conditions: .parcialmenteNublado, temperature: 14.3),
        "22": HourlyWeather(conditions: .soleado, temperature: 14.2),
        "23": HourlyWeather(conditions: .nublado, temperature: 14.1)
    ])
])
