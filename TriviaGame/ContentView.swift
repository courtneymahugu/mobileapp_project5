//
//  ContentView.swift
//  TriviaGame
//
//  Created by Courtney Mahugu on 4/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 10
    @State private var selectedCategory = 0
    @State private var difficulty = "easy"
    @State private var type = "multiple"
    @State private var navigateToGame = false
    
    let categories = [
        (id: 0, name: "Any Category"),
        (id: 9, name: "General Knowledge"),
        (id: 18, name: "Science: Computers"),
        (id: 23, name: "History"),
        (id: 21, name: "Sports")
    ]

    var body: some View {
        NavigationStack {
                    Form {
                        // ✅ All 4 required configuration options
                        Section(header: Text("Quiz Settings")) {
                            Stepper("Number of Questions: \(amount)", value: $amount, in: 1...20)

                            Picker("Category", selection: $selectedCategory) {
                                ForEach(0..<categories.count, id: \.self) {
                                    Text(categories[$0].name)
                                }
                            }

                            Picker("Difficulty", selection: $difficulty) {
                                Text("Easy").tag("easy")
                                Text("Medium").tag("medium")
                                Text("Hard").tag("hard")
                            }

                            Picker("Type", selection: $type) {
                                Text("Multiple Choice").tag("multiple")
                                Text("True / False").tag("boolean")
                            }
                        }

                        // ✅ Button to start the trivia game
                        Section {
                            Button("Start Trivia") {
                                navigateToGame = true
                            }
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                        }
                    }
                    .navigationTitle("Trivia Options")

                    // ✅ Pass all selected values to GameView, converting index to category ID
                    .navigationDestination(isPresented: $navigateToGame) {
                        let categoryID = categories[selectedCategory].id
                        GameView(
                            amount: amount,
                            difficulty: difficulty,
                            type: type,
                            category: categoryID == 0 ? nil : categoryID
                        )
                    }
                }
            }
}

#Preview {
    ContentView()
}
