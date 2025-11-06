//
//  TodoListView.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct TodoListView: View {
    @Binding var todoItems: [TodoItem]
    
    @State private var filteredItems: [TodoItem] = []
    @State private var selected: CompletionFilter = .all
    
    private let completionFilterOption = CompletionFilter.allCases
    
    enum CompletionFilter: String, CaseIterable {
        case all, completed, uncompleted
    }
    
    var body: some View {
        // We could replace for a ScrollView and a lazyVstack to pinned the header
        List {
            Section {
                ForEach($filteredItems) { $item in
                    TodoItemRow(item: $item)
                        .onChange(of: item.completed) { (_, _) in
                            guard let index = todoItems.firstIndex(where: { $0.id == item.id }) else { return }
                            todoItems[index] = item
                            filter(by: selected)
                        }
                }
            } header: {
                TodoItemHeader()
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                // Is this a good practice? Or should we avoid ?
                Picker("", selection: $selected) {
                    ForEach(completionFilterOption, id: \.self) { option in
                        Text(option.rawValue.capitalized)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: selected) { _, newValue in
                    filter(by: newValue)
                }
            }
        }
        .onAppear {
            filteredItems = todoItems
        }
    }
    
    // MARK: Filter
    private func filter(by option: CompletionFilter) {
        guard option != .all else {
            filteredItems = todoItems
            return
        }
        filteredItems = todoItems.filter { option == .completed ? $0.completed : !$0.completed }
    }
}

#Preview {
    @Previewable @State var todoItems = todoTest
    
    NavigationView {
        TodoListView(todoItems: $todoItems)
    }
}
