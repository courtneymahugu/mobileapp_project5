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
    let question: String
    let correct_answer: String
    let incorrect_answers: [String]
    
    let id = UUID()

    var allAnswers: [String] {
        (incorrect_answers + [correct_answer]).shuffled()
    }
    
    enum CodingKeys: String, CodingKey {
            case question, correct_answer, incorrect_answers
            // 👈 Not including `id` tells the decoder to ignore it
        }
}

