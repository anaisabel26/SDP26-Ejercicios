//
//  ContentView.swift
//  HeroApp
//
//  Created by Ana Márquez on 02/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State var todoItems: [TodoItem] = todoTest
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        MusicPlayer(song: .mock)
                    } label: {
                        Label("Music Player", systemImage: "music.note.list")
                    }
                    
                    NavigationLink {
                        WeatherView(city: cityMockup)
                    } label: {
                        Label("Weather", systemImage: "cloud.sun.fill")
                    }
                    
                    NavigationLink {
                        TodoListView(todoItems: $todoItems)
                    } label: {
                        Label("Todo list", systemImage: "cloud.sun.fill")
                    }

                } header: {
                    Text("Maquetando")
                }

            }
            .navigationTitle("SDP-26")
        }
    }
}

#Preview {
    ContentView()
}
