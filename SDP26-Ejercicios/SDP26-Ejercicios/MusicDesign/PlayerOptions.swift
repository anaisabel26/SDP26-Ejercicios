//
//  PlayerOptions.swift
//  HeroApp
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct PlayerOptions: View {
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isPlaying: Bool
    
    var body: some View {
        HStack(spacing: 24) {
            Button(action: {}) {
                image(with: "backward.end.fill", size: 30)
            }
            .accessibilityLabel("Backward")
            
            Button(action: {
                withAnimation {
                    isPlaying.toggle()
                }
            }) {
                image(with: isPlaying ? "pause.fill" : "play.fill", size: 50)
            }
            .accessibilityLabel(isPlaying ? "Pause" : "Play")
            
            Button(action: {}) {
                image(with: "forward.end.fill", size: 30)
            }
            .accessibilityLabel("forward")
        }
        .shadow(radius: 10)
    }
    
    private func image(with icon: String, size: CGFloat) -> some View {
        Image(systemName: icon)
            .font(.system(size: size, weight: .semibold))
            .frame(width: size, height: size)
            .foregroundStyle(.white.gradient)
            .padding()
            .background(gradient, in: Circle())
    }
    
    private var gradient: AnyGradient {
        Color.blue.mix(with: .black, by: 0.2, in: .perceptual).gradient
        
//        colorScheme == .dark ? Color.blue.gradient : Color.black.gradient
//        LinearGradient(colors: [.blue, .darkBlue, .darkBlue],
//                       startPoint: .top, endPoint: .bottom)
    }
}

#Preview {
    @Previewable @State var isplaying: Bool = false
    PlayerOptions(isPlaying: $isplaying)
}
