//
//  CustomSlider.swift
//  SDP26-Ejercicios
//
//  Created by Ana Márquez on 06/11/2025.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var value: CGFloat
    private let thumbSize: CGSize = .init(width: 30, height: 20)
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(Color.gray.opacity(0.4))
                    .frame(height: 8)
                
                Capsule()
                    .fill(LinearGradient(colors: [.purple, .pink, .orange], startPoint: .leading, endPoint: .trailing))
                    .frame(width: value * width, height: 8)
                // Thumb
                Capsule()
                    .fill(Color.white)
                    .frame(width: thumbSize.width, height: thumbSize.height)
                    .offset(x: value * width - (thumbSize.width / 2))
                    .gesture(
                        DragGesture().onChanged { gesture in
                            let newValue = min(max(0, gesture.location.x / width), 1)
                            value = newValue
                        }
                    )
                    .shadow(radius: 5)
            }
        }
        .frame(height: thumbSize.height)
    }
}

#Preview {
    @Previewable @State var volume: CGFloat = 0
    
    CustomSlider(value: $volume)
        .padding()
}
