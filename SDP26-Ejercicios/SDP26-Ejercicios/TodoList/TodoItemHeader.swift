//
//  TodoItemHeader.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 06/11/2025.
//

import SwiftUI

struct TodoItemHeader: View {
    // TODO: Create callback to manage actions
    
    var body: some View {
        HStack {
            Button("Add", systemImage: "plus") {
                // TODO: Add Action
            }
            .buttonStyle(.glassProminent)
            .buttonSizing(.flexible)
            .frame(maxWidth: .infinity)
            
            Menu {
                Button("Priority", systemImage: "arrow.up") {
                    // TODO: Add Action
                }
                
                Button("Date", systemImage: "calendar") {
                    // TODO: Add Action
                }
            } label: {
                Label("Filter", systemImage: "calendar")
                    .padding(.vertical, 6)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .background(.blue, in: Capsule())
                    .glassEffect(.clear)
                // Can I use a button here? Will that be a good practice?
//                        Button("Filter", systemImage: "calendar") {
//                            // TODO: Add Action
//                        }
//                        .buttonStyle(.glassProminent)
//                        .buttonSizing(.flexible)
//                        .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    TodoItemHeader()
}
