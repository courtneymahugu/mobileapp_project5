//
//  String+DecodeHTML.swift
//  TriviaGame
//
//  Created by Courtney Mahugu on 4/1/25.
//
import Foundation

extension String {
    var decodedHTML: String {
        var result = self
        let entities = [
            "&quot;" : "\"",
            "&apos;" : "'",
            "&amp;" : "&",
            "&lt;" : "<",
            "&gt;" : ">",
            "&#039;" : "'"
        ]
        for (entity, replacement) in entities {
            result = result.replacingOccurrences(of: entity, with: replacement)
        }
        return result
    }
}

