//
//  MusicPlayer.swift
//  HeroApp
//
//  Created by Ana Márquez on 02/11/2025.
//

import SwiftUI

struct MusicPlayer: View {
    @Environment(\.colorScheme) var colorScheme
    let song: SongModel
    
    @State var trackProgress: CGFloat = 0.1
    @State var playing = false
    @State var volume = 0.6
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Musica")
                .font(.system(.largeTitle,
                              design: .rounded,
                              weight: .semibold))
                .foregroundStyle(.white)
                .padding(.bottom, 20)
            
            MusicCircleImage()
            
            RectangleGrid()
            
            CustomSlider(value: $trackProgress)
            
            PlayerOptions(isPlaying: $playing)
            
            DiscoveryOptions()
            // MARK: Volumen
            Slider(value: $volume, label: {}) {
                Label("", systemImage: "speaker.fill")
            } maximumValueLabel: {
                Label("", systemImage: "speaker.wave.2.fill")
            }
            .labelStyle(.iconOnly)
            .tint(.white)
            .foregroundStyle(.white)
        }
        .padding(.horizontal, 40)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            LinearGradient(colors: [.blue,
                                    colorScheme == .dark ? .darkBlue : .blue,
                                    .darkBlue],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    MusicPlayer(song: songMockUp)
}
