//
//  DiscoveryOptions.swift
//  HeroApp
//
//  Created by Ana Márquez on 04/11/2025.
//

import SwiftUI

struct DiscoveryOptions: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack {
            Button {
                print("Explore selected")
            } label: {
                Text("Explorar")
                    .font(.system(.body, design: .rounded, weight: .semibold))
            }
            .foregroundStyle(.primary)
            .padding(10)
            .background(background)

            Button {
                print("Musica selected")
            } label: {
                Text("Musica")
                    .font(.system(.body, design: .rounded, weight: .semibold))
            }
            .foregroundStyle(.primary)
            .padding(10)
            .background(background)
            
            Button {
                print("Listas selected")
            } label: {
                Text("Listas")
                    .font(.system(.body, design: .rounded, weight: .semibold))
            }
            .foregroundStyle(.primary)
            .padding(10)
            .background(background)
        }
    }
    
    private var background: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(colorScheme == .dark ? .gray.opacity(0.3) : .white.opacity(0.3))
    }
}

#Preview {
    DiscoveryOptions()
}
