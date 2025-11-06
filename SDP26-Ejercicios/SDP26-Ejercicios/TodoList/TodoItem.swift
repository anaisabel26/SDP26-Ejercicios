//
//  TodoItem.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

enum Priority: String {
    case low, medium, high
    
    var percentage: Double {
        switch self {
        case .low: return 0.3
        case .medium:  return 0.5
        case .high: return 1
        }
    }
}

struct TodoItem: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var description: String
    var tag: [String]?
    var priority: Priority
    let date: Date
    var completed: Bool = false
    
    static let mock = TodoItem(title: "Buy groceries", description: "Milk, Eggs, Bread, Butter", tag: ["Shopping"], priority: .medium, date: Date.now, completed: false)
    
}

let todoTest: [TodoItem] = [
    TodoItem(title: "Buy groceries", description: "Milk, Eggs, Bread, Butter", tag: ["Shopping"], priority: .medium, date: Date().addingTimeInterval(3600), completed: false),
    TodoItem(title: "Finish project report", description: "Complete the final draft of the project report", tag: ["Work"], priority: .high, date: Date().addingTimeInterval(86400), completed: false),
    TodoItem(title: "Call mom", description: "Catch up with mom over the phone", tag: ["Personal"], priority: .low, date: Date().addingTimeInterval(7200), completed: false),
    TodoItem(title: "Gym session", description: "Leg day workout", tag: ["Health"], priority: .medium, date: Date().addingTimeInterval(10800), completed: true),
    TodoItem(title: "Pay electricity bill", description: "Pay before due date to avoid penalty", tag: ["Finance"], priority: .high, date: Date().addingTimeInterval(43200), completed: false),
    TodoItem(title: "Book flight tickets", description: "Book tickets for vacation in December", tag: ["Travel"], priority: .medium, date: Date().addingTimeInterval(259200), completed: false),
    TodoItem(title: "Read a book", description: "Read 'The Swift Programming Language' book", tag: ["Education"], priority: .low, date: Date().addingTimeInterval(604800), completed: false),
    TodoItem(title: "Clean the house", description: "Vacuum and dust all rooms", tag: ["Home"], priority: .medium, date: Date().addingTimeInterval(14400), completed: false),
    TodoItem(title: "Prepare presentation", description: "Prepare slides for Monday's meeting", tag: ["Work"], priority: .high, date: Date().addingTimeInterval(172800), completed: false),
    TodoItem(title: "Meditation", description: "15 minutes of mindfulness meditation", tag: ["Health"], priority: .low, date: Date().addingTimeInterval(1800), completed: true)
]

