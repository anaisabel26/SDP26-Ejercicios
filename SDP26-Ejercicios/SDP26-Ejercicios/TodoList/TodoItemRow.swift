//
//  TodoItemRow.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 06/11/2025.
//

import SwiftUI

struct TodoItemRow: View {
    @Binding var item: TodoItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Button("RadioButton") {
                item.completed.toggle()
            }
            .buttonStyle(RadioButtonStyle(isSelected: $item.completed))
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                Text(item.description)
                    .font(.callout)
                Text(getAttributedString(for: item))
            }
            
            Spacer()
            
            Image(systemName: "chart.bar.fill", variableValue: item.priority.percentage)
                .foregroundStyle(.blue)
        }
    }
    
    // MARK: Attributed String
    private func getAttributedString(for item: TodoItem) -> AttributedString {
        let date = item.date.formatted(date: .abbreviated, time: .shortened)
        // Generate main Attributed string and assign color and font
        var atributtedString = AttributedString(date)
        atributtedString.foregroundColor = .primary
        atributtedString.font = .callout
        // If tag exist, created string of tags and add to main attributed
        if let tags = item.tag?.map({ "#\($0)" }).joined(separator: ", ") {
            atributtedString.append(AttributedString(", "))
            var attributedTags = AttributedString("\(tags)")
            attributedTags.foregroundColor = .blue
            atributtedString.append(attributedTags)
        }
        return atributtedString
    }
}

#Preview {
    @Previewable @State var todo = TodoItem.mock
    
    TodoItemRow(item: $todo)
}
