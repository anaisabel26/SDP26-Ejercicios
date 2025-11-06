//
//  MusicCircleImage.swift
//  HeroApp
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct MusicCircleImage: View {
    var body: some View {
        Circle()
            .fill(.red.opacity(0.8))
            .strokeBorder(Color.orange.opacity(0.4), lineWidth: 40)
            .strokeBorder(Color.yellow.opacity(0.3), lineWidth: 20)
            .frame(height: 260)
            .overlay {
                Image(systemName: "music.note")
                    .font(.system(size: 60, weight: .semibold))
                    .foregroundStyle(.black)
                    .padding()
                    .background {
                        Circle()
                            .fill(Color.white.gradient)
                    }
            }
            .overlay(alignment: .bottom) {
                HStack {
                    Image(systemName: "cloud.fill")
                        .font(.system(size: 130))
                        .foregroundStyle(.white.opacity(0.9).gradient)
                    Spacer()
                    
                    Image(systemName: "cloud.fill")
                        .font(.system(size: 130))
                        .foregroundStyle(.white.opacity(0.9).gradient)
                }
            }
    }
}

#Preview {
    MusicCircleImage()
}
