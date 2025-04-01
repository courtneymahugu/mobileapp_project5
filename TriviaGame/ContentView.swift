//
//  ContentView.swift
//  TriviaGame
//
//  Created by Courtney Mahugu on 4/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 5
        @State private var difficulty = "easy"
        @State private var type = "multiple"
        @State private var navigateToGame = false

        var body: some View {
            NavigationStack {
                Form {
                    Stepper("Number of Questions: \(amount)", value: $amount, in: 1...20)
                    Picker("Difficulty", selection: $difficulty) {
                        Text("Easy").tag("easy")
                        Text("Medium").tag("medium")
                        Text("Hard").tag("hard")
                    }
                    Picker("Type", selection: $type) {
                        Text("Multiple Choice").tag("multiple")
                        Text("True / False").tag("boolean")
                    }

                    NavigationLink(destination: GameView(amount: amount, difficulty: difficulty, type: type), isActive: $navigateToGame) {
                        Button("Start Game") {
                            navigateToGame = true
                        }
                    }
                }
                .navigationTitle("Trivia Options")
            }
        }
}

#Preview {
    ContentView()
}
