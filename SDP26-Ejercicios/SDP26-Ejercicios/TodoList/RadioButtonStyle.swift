//
//  RadioButtonStyle.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 06/11/2025.
//

import SwiftUI

struct RadioButtonStyle: ButtonStyle {
    @Binding var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        Circle().fill(.clear)
            .stroke(.primary, lineWidth: 2)
            .frame(width: 30, height: 30)
            .overlay {
                Circle().fill(.blue)
                    .padding(4)
                    .opacity(isSelected ? 1 : 0)
            }
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
    }
}

#Preview {
    @Previewable @State var selected: Bool = false
    
    Button("Radio Button") {
        selected.toggle()
    }
    .buttonStyle(RadioButtonStyle(isSelected: $selected))
}
