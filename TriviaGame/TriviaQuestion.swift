//
//  TriviaQuestion.swift
//  TriviaGame
//
//  Created by Courtney Mahugu on 4/1/25.
//
import SwiftUI

struct TriviaResponse: Codable {
    let results: [TriviaQuestion]
}

struct TriviaQuestion: Codable, Identifiable {
    var id: UUID { UUID() }
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]

    var allAnswers: [String] {
        (incorrect_answers + [correct_answer]).shuffled()
    }
}

