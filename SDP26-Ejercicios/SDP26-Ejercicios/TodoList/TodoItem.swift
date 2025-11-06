//
//  TodoItem.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct Category {
    let name: String
    var color: Color = .blue
}

enum Priority {
    case low
    case medium
    case high
}

enum CompletionStatus {
    case notStarted
    case inProgress
    case completed
}

struct TodoItem {
    let id: UUID
    var title: String
    var description: String
    var category: Category
    var priority: Priority
    let date: Date
    var status: CompletionStatus = .notStarted
    
    static let mockData: [TodoItem] = [
        TodoItem(id: UUID(), title: "Buy groceries", description: "Milk, Eggs, Bread, Butter", category: Category(name: "Shopping"), priority: .medium, date: Date().addingTimeInterval(3600), status: .notStarted),
        TodoItem(id: UUID(), title: "Finish project report", description: "Complete the final draft of the project report", category: Category(name: "Work"), priority: .high, date: Date().addingTimeInterval(86400), status: .inProgress),
        TodoItem(id: UUID(), title: "Call mom", description: "Catch up with mom over the phone", category: Category(name: "Personal"), priority: .low, date: Date().addingTimeInterval(7200), status: .notStarted),
        TodoItem(id: UUID(), title: "Gym session", description: "Leg day workout", category: Category(name: "Health"), priority: .medium, date: Date().addingTimeInterval(10800), status: .completed),
        TodoItem(id: UUID(), title: "Pay electricity bill", description: "Pay before due date to avoid penalty", category: Category(name: "Finance"), priority: .high, date: Date().addingTimeInterval(43200), status: .notStarted),
        TodoItem(id: UUID(), title: "Book flight tickets", description: "Book tickets for vacation in December", category: Category(name: "Travel"), priority: .medium, date: Date().addingTimeInterval(259200), status: .inProgress),
        TodoItem(id: UUID(), title: "Read a book", description: "Read 'The Swift Programming Language' book", category: Category(name: "Education"), priority: .low, date: Date().addingTimeInterval(604800), status: .notStarted),
        TodoItem(id: UUID(), title: "Clean the house", description: "Vacuum and dust all rooms", category: Category(name: "Home"), priority: .medium, date: Date().addingTimeInterval(14400), status: .notStarted),
        TodoItem(id: UUID(), title: "Prepare presentation", description: "Prepare slides for Monday's meeting", category: Category(name: "Work"), priority: .high, date: Date().addingTimeInterval(172800), status: .inProgress),
        TodoItem(id: UUID(), title: "Meditation", description: "15 minutes of mindfulness meditation", category: Category(name: "Health"), priority: .low, date: Date().addingTimeInterval(1800), status: .completed)
    ]
}
