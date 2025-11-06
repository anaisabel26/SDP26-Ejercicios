//
//  RectangleGrid.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 06/11/2025.
//

import SwiftUI

struct RectangleGrid: View {
    let items: [GridItem] = [GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.fixed(80)),
                             GridItem(.flexible()),
                             GridItem(.flexible()),
                             GridItem(.flexible())]
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: items) {
                ForEach(1..<(7*3 + 1)) { index in
                    
                    Capsule()
                        .fill(.gray.opacity(opacity(for: index)))
                        .frame(height: 8)
                }
            }
            
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .frame(width: 10, height: 60)
                .shadow(radius: 5)
        }
    }
    
    private func opacity(for index: Int) -> Double {
        let opacities = [0.4, 0.5, 0.6, 0.8, 0.6, 0.5, 0.4]
        return opacities[(index - 1) % 7]
    }
}

#Preview {
    RectangleGrid()
}
