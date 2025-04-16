//
//  GameView.swift
//  TriviaGame
//
//  Created by Courtney Mahugu on 4/1/25.
//

import SwiftUI

struct GameView: View {
    let amount: Int
    let difficulty: String
    let type: String
    let category: Int?

    @State private var questions: [TriviaQuestion] = []
    @State private var selectedAnswers: [UUID: String] = [:]
    @State private var showScore = false
    @State private var score = 0

    var body: some View {
        VStack {
            if questions.isEmpty {
                ProgressView("Loading Questions...")
                    .onAppear {
                        TriviaAPI.fetchTrivia(amount: amount, category: category, difficulty: difficulty, type: type) { fetched in
                            self.questions = fetched
                        }
                    }
            } else {
                // Displays questions in a List view
                List(questions) { question in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(question.question.decodedHTML)

                        // Loop through shuffled answers
                        ForEach(question.allAnswers, id: \.self) { answer in
                            HStack {
                                Image(systemName: selectedAnswers[question.id] == answer ? "largecircle.fill.circle" : "circle")
                                    .foregroundColor(.blue)
                                Text(answer.decodedHTML)
                            }
                            .onTapGesture {
                                selectedAnswers[question.id] = answer // User answer selected
                            }
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            
            // Submit button to trigger score calculation
            Button("Submit") {
                calculateScore()
                showScore = true
            }
            .padding()
            .alert("Your Score", isPresented: $showScore) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("You got \(score) out of \(questions.count) correct.")
            }
            .navigationTitle("Trivia")
        }
    }

    func calculateScore() {
        score = questions.reduce(0) { result, question in
            if selectedAnswers[question.id] == question.correct_answer {
                return result + 1
            } else {
                return result
            }
        }
    }
}

