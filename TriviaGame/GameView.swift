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

    @State private var questions: [TriviaQuestion] = []
    @State private var selectedAnswers: [UUID: String] = [:]
    @State private var showScore = false
    @State private var score = 0
    @State private var timeRemaining = 60

    var body: some View {
        VStack {
            Text("Time Remaining: \(timeRemaining)").padding()
            List(questions) { question in
                VStack(alignment: .leading) {
                    Text(question.question.decodedHTML)
                    ForEach(question.allAnswers, id: \.self) { answer in
                        HStack {
                            Image(systemName: selectedAnswers[question.id] == answer ? "circle.inset.filled" : "circle")
                            Text(answer)
                        }
                        .onTapGesture {
                            selectedAnswers[question.id] = answer
                        }
                    }
                }
                .padding(.vertical)
            }

            Button("Submit") {
                calculateScore()
                showScore = true
            }
            .padding()
            .alert("Your Score", isPresented: $showScore) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("\(score)/\(questions.count) correct")
            }
        }
        .onAppear {
            TriviaAPI.fetchTrivia(amount: amount, category: nil, difficulty: difficulty, type: type) { questions in
                self.questions = questions
                startTimer()
            }
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

    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            timeRemaining -= 1
            if timeRemaining <= 0 {
                timer.invalidate()
                calculateScore()
                showScore = true
            }
        }
    }
}

